trigger TaskCallActivity on task (after insert, after update ){
    
    set<id> leadId=new set<id>();
    List<Lead> LeadList = new List<Lead>();
     
        for(Task tas: Trigger.new){
        
         
             leadId.add(tas.whoid);
             
            
             
             Lead ld = [Select LeadCallActivity__c,ActivityOfCallTracked__c from Lead where id in :leadId];
             
              if(ld.ActivityOfCallTracked__c== false){
             
             ld.LeadCallActivity__c = tas.CreatedDate;
             ld.ActivityOfCallTracked__c = True;
             
             LeadList.add(ld);
             
             System.debug('LeadList is'+LeadList);
             
            // Update ld; 
            }           
            
        }
        
          Upsert LeadList;   
   }