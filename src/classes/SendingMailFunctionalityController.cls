public with sharing class SendingMailFunctionalityController {

    
    public Lead Contactnew {get; set;}
    Public Id urlID {get; set;}
    public list<Lead>contactList {get;set;}
    
    public SendingMailFunctionalityController(){
    
        Contactnew = new Lead();
        
         urlID =  Apexpages.CurrentPage().getParameters().get('id');
         
         System.debug('UrlId is '+urlID);
         
         ContactList = [Select id,Name, Email,Subject__c,Body__c from Lead where Id=:urlID];
         
         System.debug('ContactList size is'+ContactList.Size());
         System.debug('ContactList size is'+ContactList);
    
    }
    
    
    public Void SendAnEmail() {
        
        Set<String> SetOfemail = new Set<String>();
         LIST<Messaging.SingleEmailMessage> bulkMails = new LIST<Messaging.SingleEmailMessage>(); 
        
        for(Lead Con:ContactList){
        
         String[] toAddresses = new String[] {Con.email};
         
         System.debug('toAddresses is'+toAddresses );
            
              Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
              mail.sethtmlBody(Contactnew.Body__c);
              mail.SetSubject(Contactnew.Subject__c);
              mail.setTargetObjectId(con.id);
              Mail.saveAsActivity = true;
              mail.setToAddresses(toAddresses);
              Mail.replyTo  = 'testingtheincominemail@k-2y1u6us1n2hvw011x200njcwag4ot58wvdii4r078b9r632czk.9-114ixeaa.ap1.apex.salesforce.com';
               
            bulkMails.Add(mail);  
                   
        }
        
            System.debug('bulkMails is'+bulkMails);
         Messaging.sendEmail(bulkMails);
       /* for(String Email:SetOfemail){
        
           Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
           mail.subject = 
        
        
        }*/
    }

    


}