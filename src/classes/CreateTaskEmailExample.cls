global class CreateTaskEmailExample implements Messaging.InboundEmailHandler {
 
  global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, 
                                                       Messaging.InboundEnvelope env){
 
       Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
  
    String myPlainText= '';
    
       myPlainText = email.plainTextBody;
       //myPlainText=email.HtmlBody;
   
       Task[] newTask = new Task[0];
      
    try {
      Lead vCon = [SELECT Id, Name, Email
        FROM Lead  WHERE Email = :email.fromAddress
        LIMIT 1];
        
        System.debug('Gurunath india123 size is'+Vcon);
      
      // Add a new Task to the contact record we just found above.
      newTask.add(new Task(Description =  myPlainText,
           Priority = 'Normal',
           Status = 'InboundEmail',
           Subject = email.subject,
           IsReminderSet = true,
           ReminderDateTime = System.now()+1,
           WhoId =  vCon.Id));
     
     // Insert the new Task 
     insert newTask;   

        email.replyTo = VCon.Email;
     
     System.debug('New Task Object: ' + newTask );   
    }
    // If an exception occurs when the query accesses 
    // the contact record, a QueryException is called.
    // The exception is written to the Apex debug log.
   catch (QueryException e) {
       System.debug('Query Issue: ' + e);
   }
   
   // Set the result to true. No need to send an email back to the user 
   // with an error message
   result.success = true;
   
   // Return the result for the Apex Email Service
   return result;
  }
}