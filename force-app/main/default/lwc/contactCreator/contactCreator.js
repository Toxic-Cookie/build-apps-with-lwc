import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import contact from '@salesforce/schema/Contact';
import firstName from '@salesforce/schema/Contact.FirstName';
import lastName from '@salesforce/schema/Contact.LastName';
import email from '@salesforce/schema/Contact.Email';

export default class ContactCreator extends LightningElement {
    objectApiName = contact;
    fields = [firstName, lastName, email];
    handleSuccess(onsuccess) {
        const toastEvent = new ShowToastEvent({
            title: "Contact created",
            message: "Record ID: " + onsuccess.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
}