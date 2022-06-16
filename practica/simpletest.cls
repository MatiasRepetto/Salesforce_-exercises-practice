@isTest
public class TestVerifyDate {
    
	@isTest static void testCheckDates() {
        Date auxDat = VerifyDate.CheckDates(Date.valueOf('2022-02-14'), Date.valueOf('2022-02-24'));
        System.assertEquals(Date.valueof('2022-02-24'), auxDat);
    }
    
    @isTest static void NottestCheckDates() {
        Date auxDat1 = VerifyDate.CheckDates(Date.valueOf('2022-02-14'), Date.valueOf('2022-03-24'));
        System.assertEquals(Date.valueof('2022-02-29'), auxDat1);
    }
}