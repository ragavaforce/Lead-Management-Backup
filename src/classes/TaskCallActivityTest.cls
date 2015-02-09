@isTest
Public class TaskCallActivityTest{
    Public static testMethod void Main(){
    
    
         Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        
         User u2 = new User();
         
         U2.Alias = 'newUser';
         U2.Email='newuser@testorg.com';
         U2.EmailEncodingKey='UTF-8';
         U2.LastName='Testing';
         U2.LanguageLocaleKey='en_US';
         U2.LocaleSidKey='en_US';
         U2.ProfileId = p.Id;
         U2.TimeZoneSidKey='America/Los_Angeles';
         U2.UserName='newuser123@testorg.com';
         
         Insert U2;
         
         
        Lead L = new Lead();
        
        L.LastName = 'TsetLast';
        L.Company = 'TestCompany';
        L.Status = 'Closed - Converted';
        
        Insert L;
        
        Task Task = new Task();
        Task.Subject= 'Call';
        Task.OwnerId = U2.Id;  
        Task.Whoid = L.Id;     
      
        
        Insert Task;
       
       Task.Subject = 'Meeting';
       
       Update Task;
        
        
    
    
    
    }



}