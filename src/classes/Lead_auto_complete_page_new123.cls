public with sharing class Lead_auto_complete_page_new123 {

//public list<Lead> newLead {get; set;}

public Lead_auto_complete_page_new123(ApexPages.StandardSetController controller) {
 newLead = new Lead();
 
    }

Public Lead newLead{get;set;}
    /* ---popup---  */
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
     pagereference p = new pagereference('Lead_Managemt_MN');
       p.setRedirect(true);
     return p;
     
 }

    Public Integer noOfRecords{get; set;}
    Public Integer size{get;set;}
    public ApexPages.StandardSetController setCon {
        get{
            if(setCon == null){
                size = 900;
                string queryString = 'Select id,name,Company,Phone,Title,Email,Website,country__c,Rating,createddate,ownerid from Lead ORDER BY createddate DESC';
                
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(queryString));
                setCon.setPageSize(size);
                noOfRecords = setCon.getResultSize();
            }
            return setCon;
        }set;
    }
     
    Public List<lead> getLeads(){
        List<lead> accList = new List<lead>();
        for(lead a : (List<lead>)setCon.getRecords())
            accList.add(a);
        return accList;
    }
     
    public pageReference refresh() {
        setCon = null;
        getleads();
        setCon.setPageNumber(1);
        return null;
    }
     
    public Boolean hasNext {
        get {
            return setCon.getHasNext();
        }
        set;
    }
    public Boolean hasPrevious {
        get {
            return setCon.getHasPrevious();
        }
        set;
    }
  
    public Integer pageNumber {
        get {
            return setCon.getPageNumber();
        }
        set;
    }
  
    public void first() {
        setCon.first();
    }
  
    public void last() {
        setCon.last();
    }
  
    public void previous() {
        setCon.previous();
    }
  
    public void next() {
        setCon.next();
    }
    public String rec { get; set; }

}