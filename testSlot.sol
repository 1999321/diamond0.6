pragma solidity ^0.6.0;


contract testSlotALL{
    struct ygyg{
        uint256 ks;
    }
    uint256 public uinttest;
    string public stringtest = "菜cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc";
    bytes32 public bytes32test;
    address[10] public ssdd;
    address[] public ssfff;
    string[] public testStringA;
    mapping(uint256=>string) public testMapString;
    string[1] public testStringAD;
    bytes4 public bytes4test;
    
    
    function getslot() external pure returns(uint256 ssd,uint256 off){
        assembly{ssd := uinttest_slot
                 off := uinttest_offset
        }
    }
    
    function getslot1() external pure returns(uint256 ssd,uint256 off){
        assembly{ssd := stringtest_slot
                 off := stringtest_offset
        }
    }
    
    function getslot2() external pure returns(uint256 ssd,uint256 off){
        assembly{ssd := bytes32test_slot
                 off := bytes32test_offset
        }
    }
    
    function getslot3() external pure returns(uint256 ssd,uint256 off){
        assembly{ssd := bytes4test_slot
                 off := bytes4test_offset
        }
    }
    
    function sstoreslot() external {
        uint256 s = 234;
        assembly {sstore(uinttest_slot,s)}
    }
    
    function sloadslot() external view returns(uint256) {
        uint256 s = 234;
        assembly {s := sload(uinttest_slot)}
        return s;
    }
    
    function testS() external {
        uint256 s = 9;
        uint256 v = 888;
        assembly{ sstore(s,v)}
    }
    
    function testL() external view returns(uint256){
        uint256 V ;
        assembly{V := sload(9)}
        return V;
    }
    
    function testMapping() external{
        address[11] storage testdin;
        assembly{testdin_slot := ssdd_slot}
        testdin[10] = 0x783CAbA0EE1bC2b331bCac806bbDC7A62859Ed4c;
        uint256 uyu = testdin.length;
        assembly{uyu := sload(add(ssdd_slot,10))}
        assembly{sstore(uinttest_slot,uyu)}
        bytes32 ffff = bytes32(uinttest);
        assembly{sstore(bytes32test_slot,ffff)}
        uyu = ssfff.length;
        assembly{sstore(uinttest_slot,uyu)}
        string memory oo = "oooo";
        bytes memory ssdddd = bytes(oo);
    }
    
    function teststring() external view returns(string memory ) {
        string storage testStr1 ;
        //bytes memory testbytes1 = bytes(testStr1);
        assembly{testStr1_slot := stringtest_slot}
        //string memory demostr = "ooooooooooo";
        uint256 demostr;
        assembly{demostr := stringtest_slot}
        bytes memory sour = abi.encodePacked(demostr);
        bytes32 position = keccak256(sour);
        bytes memory taker;
       // assembly{sstore(stringtest_slot,demostr)}
        //assembly{taker := sload(position)}
        //string memory strTest = string(abi.encodePacked(taker));
        string memory strTest = testStr1;
        //demostr = stringtest;
        return strTest;
    }
    
    function testString1() external {
        string memory demostr = "ooooooooooo";
        string storage testStr1 ;
        //bytes memory testbytes1 = bytes(testStr1);
        assembly{testStr1_slot := stringtest_slot}
        //testStr1.push(demostr);
    }
    
    function testStrA() external {
        string[] storage testSA;
        assembly{testSA_slot := testStringA_slot}
        //string memory ssddd = ";;;;";
        //uint256 ssd = testSA[0].length;
        testSA.push("iiii");
    }
    
    function testMapString0() external{
        mapping(uint256=>string) storage mapstr = MappUS();
        assembly{mapstr_slot := testMapString_slot}
        mapstr[0] = "pp";
    }
    
    function testMapString1() external view returns(uint256){
        mapping(uint256=>string) storage mapstr = MappUS();
        assembly{mapstr_slot := testMapString_slot}
        return 1;
        //return mapstr[0].length;
    }
    
    function MappUS() internal view returns(mapping(uint256=>string) storage ds){
        assembly{ds_slot := testMapString_slot}
    }
    
    function testStringAD0() external {
        string[1] storage testSA;
        assembly{testSA_slot := testStringAD_slot}
        //string memory ssddd = ";;;;";
        //uint256 ssd = testSA[0].length;
        testSA[0] = "iiii";
    }
}
