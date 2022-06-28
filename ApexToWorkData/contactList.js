import { LightningElement, wire } from 'lwc';
import FNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LNAME_FIELD from '@salesforce/schema/Contact.LastName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import getContacts from '@salesforce/apex/ContactController.getContacts';
const COLUMNS = [
    { label: 'Contact First Name', fieldName: FNAME_FIELD.fieldApiName, type: 'text' },
    { label: 'Contact Last Name', fieldName: LNAME_FIELD.fieldApiName, type: 'text' },
    { label: 'Contact Email', fieldName: EMAIL_FIELD.fieldApiName, type: 'mail' }
];
export default class contactList extends LightningElement {
    columns = COLUMNS;
    @wire(getContacts)
    contacts;
}