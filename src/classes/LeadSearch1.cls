public with sharing class LeadSearch1{

  public List<Lead> cons {get; set;}  
       


    public LeadSearch1(ApexPages.StandardSetController controller) {
    
    
    
     cons=[select id,name,Company,Phone,Email,title,Country__c,Rating,ownerid,createddate from Lead where isconverted!=true ORDER BY ownerid,company ASC limit 1000];
          newLead = new Lead();
   
   
    }
Contact c=new Contact();
Public Lead newLead{get;set;}

   


    //-------------------Popup----------------
    
     public boolean displayPopup {get; set;}     
    
    public void closePopup() {        
        displayPopup = false;    
    }     
    public void showPopup() {        
        displayPopup = true;    
    }
      public pagereference saveRecord(){
     
     
     insert newLead ;
     closePopup();
     pagereference pag = new pagereference('/apex/Lead_Managemt');
   pag.setRedirect(true);
     
     return pag;
   
 }

    //-------------------Get and set parameters----------------------------
    public String rec { get; set; }
    
     
                                                    }