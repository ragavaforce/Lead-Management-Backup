public class DataTableExampleController {

    public String rec { get; set; }
    public List<lead> contactList {
        get {
            if (contactList == null) {
                contactList = [SELECT company,name,Phone,email,Country__c,website,rating,createddate FROM lead limit 10000];
            }
            return contactList;
        }
        set;
    }
}