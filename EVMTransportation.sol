pragma solidity >=0.4.25 <0.6.0;

contract EVMTransportation
{
    //Set of States
    enum StateType { Dispatched, InTransit, Completed,Failed}

    //List of properties
    StateType public  State;
    address public  BHEL;
    address public  Counterparty;
    address public  PreviousCounterparty;
    //address public  Device;
    address public  SupplyChainObserver;
    bool public SealSt ;
    int public pass ;
    int public passs ;
    //SensorType public  ComplianceSensorType;
    //bool public  ComplianceStatus;
    //string public ComplianceDetail;
    //int public  UpdateTimestamp;

    constructor( address supplyChainObservers, bool SealSts, int pass1) public
    {
        //ComplianceStatus = true;
        //ComplianceSensorReading = -1;
        SealSt=SealSts ;
        BHEL = msg.sender;
        Counterparty = BHEL;
        SupplyChainObserver = supplyChainObservers;
        State = StateType.Dispatched;
        pass=pass1 ;
//ComplianceDetail = "N/A";
    }

    function IngestTelemetry(bool SealStf) public
    {
        // Separately check for states and sender
        // to avoid not checking for state when the sender is the device
        // because of the logical OR
        if ( State == StateType.Completed )
        {
            revert();
        }
        SealSt=SealStf ;

      /*  if ( State == StateType.SealBroken )
        {
            revert();
        }*/

      /*  if (Device != msg.sender)
        {
            revert();
        }*/

        //UpdateTimestamp = timestamp();

        /*if (humidity > MaxHumidity || humidity < MinHumidity)
        {
            ComplianceSensorType = SensorType.Humidity;
            ComplianceSensorReading = humidity;
            ComplianceDetail = "Humidity value out of range.";
            ComplianceStatus = false;
        }
        else if (temperature > MaxTemperature || temperature < MinTemperature)
        {
            ComplianceSensorType = SensorType.Temperature;
            ComplianceSensorReading = temperature;
            ComplianceDetail = "Temperature value out of range.";
            ComplianceStatus = false;
        }*/

        if (SealStf == false)
        {
            State = StateType.Completed;
        }
    }

    function TransferResponsibility(address newCounterparty, bool SealSt) public
    {
        // keep the state checking, message sender, and device checks separate
        // to not get cloberred by the order of evaluation for logical OR
        if ( State == StateType.Completed )
        {
            revert();
        }

      /*  if ( State == StateType.SealBroken )
        {
            revert();
        }*/

        if ( BHEL != msg.sender && Counterparty != msg.sender )
        {
            revert();
        }

      /*  if ( newCounterparty == Device )
        {
            revert();
        }*/

        if (State == StateType.Dispatched)
        {
            State = StateType.InTransit;
        }
        if (SealSt == false)
        {
          State = StateType.Failed;
        }

        PreviousCounterparty = Counterparty;
        Counterparty = newCounterparty;


    }

    function Complete(int passs) public
    {
        // keep the state checking, message sender, and device checks separate
        // to not get cloberred by the order of evaluation for logical OR
        if ( passs!=pass)
        {
          State = StateType.Failed ;
        }
        else if(passs==pass)
        {
          State = StateType.Completed;
          PreviousCounterparty = Counterparty;
          Counterparty = 0x0000000000000000000000000000000000000000;

        }


    }
}
