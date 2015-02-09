public with sharing class LeadSearch_MN{

transient public List<Lead> cons {get; set;}  
       


public LeadSearch_MN(ApexPages.StandardSetController controller) {
    
    
    
cons=[select id,name,Company,Phone,Email,title,Country__c,Rating,ownerid from Lead where isconverted!=true ORDER BY ownerid,company ASC];
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
    
    // ---------------- pagination Class  --------------------------
    
       public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [select id,name,Company,Phone,Email,title,Country__c,Rating,ownerid from Lead where isconverted!=true ORDER BY ownerid,company ASC]));
            }
            return setCon;
        }
        set;
    }

    // Initialize setCon and return a list of records
    public List<Lead > getOpportunities() {
        return (List<Lead >) setCon.getRecords();
    }
    
     
}