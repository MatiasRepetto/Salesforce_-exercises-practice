public with sharing class AddPrimaryContact implements Queueable{
    private
        Contact contactVar;
        string state;


    public

        void constructor(Contact arg1, string arg2){
            this.contactVar = arg1;
            this.state = arg2;
        }

        public void execute(QueueableContext context){
            List<Account> acc_lst = [SELECT id, name, BillingState FROM account WHERE account.BillingState = :this.state limit 200];
            list<Contact> auxLstCont = new list<Contact>();
            for(Account a : acc_lst){
                Contact contaux = new Contact();
                contaux = this.contactVar.clone(false,false,false,false);
                contaux.AccountId = a.Id;
                auxLstCont.add(contaux); 
            }
            insert auxLstCont;
        }
}
