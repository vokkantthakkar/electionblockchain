pragma solidity >=0.4.25 <0.6.0;

contract EVMTransportation2
{
    //Set of States
    enum StateType { Dispatched, InTransit, Completed,Failed}

    //List of properties
    StateType public  State;
    address public  BHEL;
    address public  Counterparty;
    address public  PreviousCounterparty;
    address public  SupplyChainObserver;
    bool public SealSt ;
    int public pass ;
    int public passs ;
    string public videoHash ;

    constructor( address supplyChainObservers, bool SealSts, int pass1, string memory videoHash1) public
    {
        SealSt=SealSts ;
        BHEL = msg.sender;
        Counterparty = BHEL;
        SupplyChainObserver = supplyChainObservers;
        State = StateType.Dispatched;
        pass=pass1 ;
        videoHash=videoHash1 ;
    }

    

    function TransferResponsibility(address newCounterparty, bool SealSt, string memory videoHash) public
    {
        // keep the state checking, message sender, and device checks separate
        // to not get cloberred by the order of evaluation for logical OR
        if ( State == StateType.Completed )
        {
            revert();
        }


        if ( BHEL != msg.sender && Counterparty != msg.sender )
        {
            revert();
        }


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