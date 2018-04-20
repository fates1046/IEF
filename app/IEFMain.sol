pragma solidity ^0.4.21;   

contract IEFMain {
    
    address public owner; 
    uint public UnitDecimal = 10**18;
    
    function IEFMain() public {
        owner = msg.sender;
    }
    
    // membership
    struct Membership {
        uint MemIndex; // from 0. same as row number
        uint JoinDate; // timestamp
        uint MemType; // 1:investor, 2:manager, 99:IEF team
        bytes32 UserName;
        bytes32 Email;
        address WalletAddress;
    }
    
    Membership[] public MembershipDB;
    uint public LastMemIndex=0;
    mapping (bytes32 => uint) MemIndexByEmail;
    
    function MembershipJoin(uint _NumOfData, uint[] _JoinDate, uint[] _MemType, bytes32[] _UserName,
    bytes32[] _Email, address[] _WalletAddress) public returns(uint) {
        Membership memory m;
        for (uint Num=0 ; Num<_NumOfData ; Num++) {
            m.MemIndex=LastMemIndex;
            m.JoinDate=_JoinDate[Num];
            m.MemType=_MemType[Num];
            m.UserName=_UserName[Num];
            m.Email=_Email[Num];
            if (_WalletAddress[Num]==address(0)) { m.WalletAddress=address(keccak256(_Email[Num]));}
            else {m.WalletAddress=_WalletAddress[Num];}
            MembershipDB.push(m);
            MemIndexByEmail[_Email[Num]]=LastMemIndex;
            LastMemIndex = LastMemIndex + 1;
        }
        return Num+1;
    }

    // manager status
    struct ManagerStatusHist {
        uint TDate;
        uint MemIndex;
        uint ElectedStatus; // true if elected, false if not elected
        uint StatusEvent; // 0:no event, 1:elected, 2:exiled
    }

    ManagerStatusHist[] public ManagerStatusHistDB;

    function SaveManagerStatusHist(uint _NumOfData, uint[] _TDate, uint[] _MemIndex, uint[] _ElectedStatus, uint[] _StatusEvent)
    public returns(uint) {
        require(msg.sender == owner);
        ManagerStatusHist memory m;
        uint countupdate=0;
        for (uint Num=0 ; Num<_NumOfData ; Num++) {
            m.TDate = _TDate[Num];
            m.MemIndex = _MemIndex[Num];
            m.ElectedStatus = _ElectedStatus[Num];
            m.StatusEvent = _StatusEvent[Num];
            ManagerStatusHistDB.push(m);
            countupdate=countupdate+1;
        }
        return countupdate;
    }

    function LoadManagerStatusHist(uint _TDate, uint _MemIndex)
    public view returns(uint,uint[],uint[],uint[],uint[]) {
        require(msg.sender == owner);
        uint arrLength = ManagerStatusHistDB.length;
        uint[] memory m1 = new uint[](arrLength);
        uint[] memory m2 = new uint[](arrLength);
        uint[] memory m3 = new uint[](arrLength);
        uint[] memory m4 = new uint[](arrLength);
        uint i = 0;
        uint memoryIndex = 0;
        for (i = 0; i < arrLength; i++) {
            if (_TDate == 0 || ManagerStatusHistDB[i].TDate == _TDate) {
                if (_MemIndex == 0 || ManagerStatusHistDB[i].MemIndex == _MemIndex) {
                    m1[memoryIndex] = ManagerStatusHistDB[i].TDate;
                    m2[memoryIndex] = ManagerStatusHistDB[i].MemIndex;
                    m3[memoryIndex] = ManagerStatusHistDB[i].ElectedStatus;
                    m4[memoryIndex] = ManagerStatusHistDB[i].StatusEvent;
                    memoryIndex = memoryIndex+1;
                }
            }
        }
        return (memoryIndex,m1,m2,m3,m4);
    }

    //fund ownership status
    struct FundOwnershipStatus {
        uint MemIndex;
        uint FundOwnedUnit; // number of unit * 10^18
        uint FundBuyPriceUSD; // USD price * 10^18
    }

    FundOwnershipStatus[] public FundOwnershipStatusDB;

    // fund ownership transaction
    struct FundOwnershipTransaction {
        uint TDate;
        uint MemIndex;
        uint FundBuyOrSell; // 1:Buy, 2:Sell
        uint FundTransactionUnit; // number of unit * 10^18
        uint FundTransactionPrice; // price * 10^18
    }

    FundOwnershipTransaction[] public FundOwnershipTransactionDB;
    uint public LastFundOwnershipTransaction=0;

    function BuyFundFromInvestor(uint _NumOfData, uint[] _TDate, uint[] _MemIndex, uint[] _FundBuyUnit,
    uint[] _FundBuyPriceUSDNow) public returns(uint) {
        require(msg.sender == owner);
        uint i=0;
        uint Num=0;
        uint NumOfUpdate=0;
        uint BeforeFundOwnedUnit=0;
        uint BeforeFundBuyPriceUSD=1;
        for (Num=0 ; Num<_NumOfData ; Num++) {
            BeforeFundOwnedUnit=0;
            BeforeFundBuyPriceUSD=1;
            for (i=0 ; i<FundOwnershipStatusDB.length ; i++) {
                if (FundOwnershipStatusDB[i].MemIndex == _MemIndex[Num]) {
                    NumOfUpdate=NumOfUpdate+1;
                    // update status
                    BeforeFundOwnedUnit = FundOwnershipStatusDB[i].FundOwnedUnit;
                    BeforeFundBuyPriceUSD = FundOwnershipStatusDB[i].FundBuyPriceUSD;
                    FundOwnershipStatusDB[i].FundOwnedUnit = BeforeFundOwnedUnit+_FundBuyUnit[Num];
                    FundOwnershipStatusDB[i].FundBuyPriceUSD = ((BeforeFundOwnedUnit*BeforeFundBuyPriceUSD
                    + _FundBuyUnit[Num]*_FundBuyPriceUSDNow[Num])/(BeforeFundOwnedUnit+_FundBuyUnit[Num]))*UnitDecimal;
                    // add transaction
                    FundOwnershipTransactionDB[LastFundOwnershipTransaction].TDate=_TDate[Num];
                    FundOwnershipTransactionDB[LastFundOwnershipTransaction].MemIndex=_MemIndex[Num];
                    FundOwnershipTransactionDB[LastFundOwnershipTransaction].FundBuyOrSell=1;
                    FundOwnershipTransactionDB[LastFundOwnershipTransaction].FundTransactionUnit=_FundBuyUnit[Num];
                    FundOwnershipTransactionDB[LastFundOwnershipTransaction].FundTransactionPrice=_FundBuyPriceUSDNow[Num];
                    LastFundOwnershipTransaction=LastFundOwnershipTransaction+1;
                    break;
                }
            }
        }
        return NumOfUpdate;
    }

    function SellFundFromInvestor(uint _NumOfData, uint[] _TDate, uint[] _MemIndex, uint[] _FundSellUnit,
    uint[] _FundSellPriceUSDNow) public returns(uint) {
        require(msg.sender == owner);
        uint i=0;
        uint Num=0;
        uint NumOfUpdate=0;
        uint BeforeFundOwnedUnit=0;
        for (Num=0 ; Num<_NumOfData ; Num++) {
            BeforeFundOwnedUnit=0;
            for (i=0 ; i<FundOwnershipStatusDB.length ; i++) {
                if (FundOwnershipStatusDB[i].MemIndex == _MemIndex[Num]) {
                    NumOfUpdate=NumOfUpdate+1;
                    // update status
                    BeforeFundOwnedUnit = FundOwnershipStatusDB[i].FundOwnedUnit;
                    FundOwnershipStatusDB[i].FundOwnedUnit = BeforeFundOwnedUnit - _FundSellUnit[Num];
                    // add transaction
                    FundOwnershipTransactionDB[LastFundOwnershipTransaction].TDate=_TDate[Num];
                    FundOwnershipTransactionDB[LastFundOwnershipTransaction].MemIndex=_MemIndex[Num];
                    FundOwnershipTransactionDB[LastFundOwnershipTransaction].FundBuyOrSell=2;
                    FundOwnershipTransactionDB[LastFundOwnershipTransaction].FundTransactionUnit=_FundSellUnit[Num];
                    FundOwnershipTransactionDB[LastFundOwnershipTransaction].FundTransactionPrice=_FundSellPriceUSDNow[Num];
                    LastFundOwnershipTransaction=LastFundOwnershipTransaction+1;
                    break;
                }
            }
        }
        return NumOfUpdate;
    }

    // manager fund history
    struct ManagerFundHist {
        uint TDate;
        uint MemIndex;
        int DailyReturnUSD; // value of %(10%=0.1) * 10^18
        uint FundShareRatio; // value of %(10%=0.1) * 10^18
        uint AgeOfManager; // in days
    }

    struct ManagerFundAUMHist {
        int AUMFundFlowUSD; // USD amount * 10^18
        int AUMAllocationUSD; // USD amount * 10^18
        uint AUMFeeUSD; // USD amount * 10^18
        uint AUMAfterAdjustUSD; // USD amount * 10^18
    }

    ManagerFundHist[] public ManagerFundHistDB;
    ManagerFundAUMHist[] public ManagerFundAUMHistDB;
    uint public LastManagerFundHist=0;

    function SaveManagerFundHist(uint _NumOfData, uint[] _TDate, uint[] _MemIndex, int[] _DailyReturnUSD, int[] _AUMFundFlowUSD,
    int[] _AUMAllocationUSD, uint[] _AUMFeeUSD, uint[] _AUMAfterAdjustUSD, uint[] _FundShareRatio, uint[] _AgeOfManager)
    public returns(uint) {
        require(msg.sender == owner);
        for (uint Num=0 ; Num<_NumOfData ; Num++) {
            ManagerFundHistDB[LastManagerFundHist].TDate=_TDate[Num];
            ManagerFundHistDB[LastManagerFundHist].MemIndex=_MemIndex[Num];
            ManagerFundHistDB[LastManagerFundHist].DailyReturnUSD=_DailyReturnUSD[Num];
            ManagerFundAUMHistDB[LastManagerFundHist].AUMFundFlowUSD=_AUMFundFlowUSD[Num];
            ManagerFundAUMHistDB[LastManagerFundHist].AUMAllocationUSD=_AUMAllocationUSD[Num];
            ManagerFundAUMHistDB[LastManagerFundHist].AUMFeeUSD=_AUMFeeUSD[Num];
            ManagerFundAUMHistDB[LastManagerFundHist].AUMAfterAdjustUSD=_AUMAfterAdjustUSD[Num];
            ManagerFundHistDB[LastManagerFundHist].FundShareRatio=_FundShareRatio[Num];
            ManagerFundHistDB[LastManagerFundHist].AgeOfManager=_AgeOfManager[Num];
        }
        return Num+1;
    }

    function LoadManagerFundHist(uint _TDate, uint _MemIndex) public view returns(uint, uint[], uint[], int[],uint[],uint[]) {
        require(msg.sender == owner);
        uint[] memory m1 = new uint[](ManagerFundHistDB.length);
        uint[] memory m2 = new uint[](ManagerFundHistDB.length);
        int[] memory m3 = new int[](ManagerFundHistDB.length);
        uint[] memory m4 = new uint[](ManagerFundHistDB.length);
        uint[] memory m5 = new uint[](ManagerFundHistDB.length);
        uint memoryIndex = 0;
        for (uint i=0 ; i<ManagerFundHistDB.length ; i++) {
            if (_TDate == 0 || ManagerStatusHistDB[i].TDate == _TDate) {
                if (_MemIndex == 0 || ManagerStatusHistDB[i].MemIndex == _MemIndex) {
                    m1[memoryIndex] = ManagerFundHistDB[i].TDate;
                    m2[memoryIndex] = ManagerFundHistDB[i].MemIndex;
                    m3[memoryIndex] = ManagerFundHistDB[i].DailyReturnUSD;
                    m4[memoryIndex] = ManagerFundHistDB[i].FundShareRatio;
                    m5[memoryIndex] = ManagerFundHistDB[i].AgeOfManager;
                    memoryIndex = memoryIndex + 1;
                }
            }
        }
        return (memoryIndex,m1,m2,m3,m4,m5);
    }

    function LoadManagerFundAUMHist(uint _TDate, uint _MemIndex) public view returns(uint, int[], int[], uint[],uint[]) {
        require(msg.sender == owner);
        int[] memory m1 = new int[](ManagerFundHistDB.length);
        int[] memory m2 = new int[](ManagerFundHistDB.length);
        uint[] memory m3 = new uint[](ManagerFundHistDB.length);
        uint[] memory m4 = new uint[](ManagerFundHistDB.length);
        uint memoryIndex = 0;
        for (uint i=0 ; i<ManagerFundHistDB.length ; i++) {
            if (_TDate == 0 || ManagerStatusHistDB[i].TDate == _TDate) {
                if (_MemIndex == 0 || ManagerStatusHistDB[i].MemIndex == _MemIndex) {
                    m1[memoryIndex] = ManagerFundAUMHistDB[i].AUMFundFlowUSD;
                    m2[memoryIndex] = ManagerFundAUMHistDB[i].AUMAllocationUSD;
                    m3[memoryIndex] = ManagerFundAUMHistDB[i].AUMFeeUSD;
                    m4[memoryIndex] = ManagerFundAUMHistDB[i].AUMAfterAdjustUSD;
                    memoryIndex = memoryIndex + 1;
                }
            }
        }
        return (memoryIndex,m1,m2,m3,m4);
    }

    // total fund history
    struct TotalFundHist {
        uint TDate;
        int DailyReturnUSD; // value of %(10%=0.1) * 10^18
        int AUMFundFlowUSD; // USD amount * 10^18
        int AUMAllocationUSD; // USD amount * 10^18
        uint AUMFeeUSD; // USD amount * 10^18
        uint AUMAfterAdjustUSD; // USD amount * 10^18
    }

    TotalFundHist[] public TotalFundHistDB;
    uint public LastTotalFundHist=0;

    function SaveTotalFundHist(uint _NumOfData, uint[] _TDate, int[] _DailyReturnUSD, int[] _AUMFundFlowUSD,
    int[] _AUMAllocationUSD, uint[] _AUMFeeUSD, uint[] _AUMAfterAdjustUSD)
    public returns(uint) {
        require(msg.sender == owner);
        for (uint Num=0 ; Num<_NumOfData ; Num++) {
            TotalFundHistDB[LastManagerFundHist].TDate=_TDate[Num];
            TotalFundHistDB[LastManagerFundHist].DailyReturnUSD=_DailyReturnUSD[Num];
            TotalFundHistDB[LastManagerFundHist].AUMFundFlowUSD=_AUMFundFlowUSD[Num];
            TotalFundHistDB[LastManagerFundHist].AUMAllocationUSD=_AUMAllocationUSD[Num];
            TotalFundHistDB[LastManagerFundHist].AUMFeeUSD=_AUMFeeUSD[Num];
            TotalFundHistDB[LastManagerFundHist].AUMAfterAdjustUSD=_AUMAfterAdjustUSD[Num];
        }
        return Num+1;
    }

    function LoadTotalFundHist(uint _TDate) public view returns(uint, uint[], int[]) {
        require(msg.sender == owner);
        uint[] memory m1 = new uint[](TotalFundHistDB.length);
        int[] memory m2 = new int[](TotalFundHistDB.length);
        uint memoryIndex = 0;
        for (uint i=0 ; i<TotalFundHistDB.length ; i++) {
            if (_TDate == 0 || TotalFundHistDB[i].TDate == _TDate) {
                m1[memoryIndex] = TotalFundHistDB[i].TDate;
                m2[memoryIndex] = TotalFundHistDB[i].DailyReturnUSD;
                memoryIndex = memoryIndex + 1;
            }
        }
        return (memoryIndex,m1,m2);
    }

    function LoadTotalFundAUMHist(uint _TDate) public view returns(uint, int[],int[],uint[],uint[]) {
        require(msg.sender == owner);
        int[] memory m3 = new int[](TotalFundHistDB.length);
        int[] memory m4 = new int[](TotalFundHistDB.length);
        uint[] memory m5 = new uint[](TotalFundHistDB.length);
        uint[] memory m6 = new uint[](TotalFundHistDB.length);
        uint memoryIndex = 0;
        for (uint i=0 ; i<TotalFundHistDB.length ; i++) {
            if (_TDate == 0 || TotalFundHistDB[i].TDate == _TDate) {
                m3[memoryIndex] = TotalFundHistDB[i].AUMFundFlowUSD;
                m4[memoryIndex] = TotalFundHistDB[i].AUMAllocationUSD;
                m5[memoryIndex] = TotalFundHistDB[i].AUMFeeUSD;
                m6[memoryIndex] = TotalFundHistDB[i].AUMAfterAdjustUSD;
                memoryIndex = memoryIndex + 1;
            }
        }
        return (memoryIndex,m3,m4,m5,m6);
    }

    // scoring performance
    struct ScoringPerformance {
        uint TDate;
        uint MemIndex;
        uint MReturnUSDScore; // value of %(10%=0.1) * 10^18
        uint QReturnUSDScore; // value of %(10%=0.1) * 10^18
        uint YReturnUSDScore; // value of %(10%=0.1) * 10^18
    }

    struct ScoringStability {
        uint Scoring1YAVGScore; // value of %(10%=0.1) * 10^18
        uint RAPMScore; // value of %(10%=0.1) * 10^18
    }

    struct ScoringQuality {
        uint RecentVoteCommunityScore; // value of %(10%=0.1) * 10^18
        uint RecentVoteIEFTeamScore; // value of %(10%=0.1) * 10^18
    }

    ScoringPerformance[] public ScoringPerformanceDB;
    ScoringStability[] public ScoringStabilityDB;
    ScoringQuality[] public ScoringQualityDB;
    uint public LastScoring=0;

    function SaveScoring(uint _NumOfData, uint[] _TDate, uint[] _MemIndex, uint[] _MReturnUSDScore, uint[] _QReturnUSDScore,
    uint[] _YReturnUSDScore, uint[] _Scoring1YAVGScore, uint[] _RAPMScore,
    uint[] _RecentVoteCommunityScore, uint[] _RecentVoteIEFTeamScore) public returns(uint) {
        for (uint Num=0 ; Num<_NumOfData ; Num++) {
            ScoringPerformanceDB[LastScoring].TDate = _TDate[Num];
            ScoringPerformanceDB[LastScoring].MemIndex = _MemIndex[Num];
            ScoringPerformanceDB[LastScoring].MReturnUSDScore = _MReturnUSDScore[Num];
            ScoringPerformanceDB[LastScoring].QReturnUSDScore = _QReturnUSDScore[Num];
            ScoringPerformanceDB[LastScoring].YReturnUSDScore = _YReturnUSDScore[Num];
            ScoringStabilityDB[LastScoring].Scoring1YAVGScore = _Scoring1YAVGScore[Num];
            ScoringStabilityDB[LastScoring].RAPMScore = _RAPMScore[Num];
            ScoringQualityDB[LastScoring].RecentVoteCommunityScore = _RecentVoteCommunityScore[Num];
            ScoringQualityDB[LastScoring].RecentVoteIEFTeamScore = _RecentVoteIEFTeamScore[Num];
            LastScoring=LastScoring+1;
        }
        return Num+1;
    }

    function LoadScoringPerformance() public view returns(uint, uint[],uint[],uint[],uint[],uint[]) {
        require(msg.sender == owner);
        uint[] memory m1 = new uint[](ScoringPerformanceDB.length);
        uint[] memory m2 = new uint[](ScoringPerformanceDB.length);
        uint[] memory m3 = new uint[](ScoringPerformanceDB.length);
        uint[] memory m4 = new uint[](ScoringPerformanceDB.length);
        uint[] memory m5 = new uint[](ScoringPerformanceDB.length);
        uint memoryIndex = 0;
        for (uint Num=0 ; Num<ScoringPerformanceDB.length ; Num++) {
            m1[memoryIndex] = ScoringPerformanceDB[Num].TDate;
            m2[memoryIndex] = ScoringPerformanceDB[Num].MemIndex;
            m3[memoryIndex] = ScoringPerformanceDB[Num].MReturnUSDScore;
            m4[memoryIndex] = ScoringPerformanceDB[Num].QReturnUSDScore;
            m5[memoryIndex] = ScoringPerformanceDB[Num].YReturnUSDScore;
            memoryIndex=memoryIndex+1;
        }
        return (memoryIndex, m1,m2,m3,m4,m5);
    }

    // fee distribution
    struct FeeDistributionHist {
        uint TDate;
        uint MemIndex;
        uint FeeUSD; // value of USD * 10^18
    }

    FeeDistributionHist[] public FeeDistributionHistDB;
    uint public LastFeeDistributionHist=0;

    function SaveFeeDistributionHist(uint _NumOfData, uint[] _TDate, uint[] _MemIndex, uint[] _FeeUSD) public returns(uint) {
        for (uint Num=0 ; Num<_NumOfData ; Num++) {
            FeeDistributionHistDB[LastFeeDistributionHist].TDate = _TDate[Num];
            FeeDistributionHistDB[LastFeeDistributionHist].MemIndex = _MemIndex[Num];
            FeeDistributionHistDB[LastFeeDistributionHist].FeeUSD = _FeeUSD[Num];
            LastFeeDistributionHist=LastFeeDistributionHist+1;
        }
        return Num+1;
    }

    function LoadFeeDistributionHist() public view returns(uint, uint[],uint[],uint[]) {
        require(msg.sender == owner);
        uint[] memory m1 = new uint[](FeeDistributionHistDB.length);
        uint[] memory m2 = new uint[](FeeDistributionHistDB.length);
        uint[] memory m3 = new uint[](FeeDistributionHistDB.length);
        uint memoryIndex = 0;
        for (uint Num=0 ; Num<FeeDistributionHistDB.length ; Num++) {
            m1[memoryIndex] = FeeDistributionHistDB[Num].TDate;
            m2[memoryIndex] = FeeDistributionHistDB[Num].MemIndex;
            m3[memoryIndex] = FeeDistributionHistDB[Num].FeeUSD;
            memoryIndex=memoryIndex+1;
        }
        return (memoryIndex, m1,m2,m3);
    }

    // vote history
    struct VoteHist {
        uint TDate;
        uint MemIndex;
        uint VoteGoodMemIndex;
        uint VoteBadMemIndex;
    }

    VoteHist[] public VoteHistDB;
    uint public LastVoteHist=0;

    function SaveVoteHist(uint _NumOfData, uint[] _TDate, uint[] _MemIndex, uint[] _VoteGoodMemIndex, uint[] _VoteBadMemIndex)
    public returns(uint) {
        for (uint Num=0 ; Num<_NumOfData ; Num++) {
            VoteHistDB[LastVoteHist].TDate = _TDate[Num];
            VoteHistDB[LastVoteHist].MemIndex = _MemIndex[Num];
            VoteHistDB[LastVoteHist].VoteGoodMemIndex = _VoteGoodMemIndex[Num];
            VoteHistDB[LastVoteHist].VoteBadMemIndex = _VoteBadMemIndex[Num];
            LastVoteHist=LastVoteHist+1;
        }
        return Num+1;
    }

    function LoadVoteHist() public view returns(uint, uint[],uint[],uint[],uint[]) {
        require(msg.sender == owner);
        uint[] memory m1 = new uint[](VoteHistDB.length);
        uint[] memory m2 = new uint[](VoteHistDB.length);
        uint[] memory m3 = new uint[](VoteHistDB.length);
        uint[] memory m4 = new uint[](VoteHistDB.length);
        uint memoryIndex = 0;
        for (uint Num=0 ; Num<VoteHistDB.length ; Num++) {
            m1[memoryIndex] = VoteHistDB[Num].TDate;
            m2[memoryIndex] = VoteHistDB[Num].MemIndex;
            m3[memoryIndex] = VoteHistDB[Num].VoteGoodMemIndex;
            m3[memoryIndex] = VoteHistDB[Num].VoteBadMemIndex;
            memoryIndex=memoryIndex+1;
        }
        return (memoryIndex, m1,m2,m3,m4);
    }
    
}
