import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import bongbong from '@salesforce/resourceUrl/BongBong';
import './bongBong.css';

export default class BongBong extends LightningElement {
    icon = bongbong;
    isDragging = false;
    startX = 0;
    startY = 0;

    handleClick(event) {
        const toastEvent = new ShowToastEvent({
            title: "Bong Bong!",
            message: "Bong Bong",
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
        //this.template.querySelector('.cube').style.transform = `rotateX(-25deg) rotateY(45deg)`;
        //this.template.querySelector('.cube').style.animation = `spin 5s linear infinite`;
    }

    handleMouseDown(event) {
        this.isDragging = true;
        this.startX = event.clientX;
        this.startY = event.clientY;
        //this.template.querySelector('.cube').style.animation = 'none';
    }

    handleMouseMove(event) {
        if (!this.isDragging) return;
        const dx = event.clientX - this.startX;
        const dy = event.clientY - this.startY;
        this.startX = event.clientX;
        this.startY = event.clientY;
        //this.rotateCube(dx, dy);
    }

    handleMouseUp() {
        this.isDragging = false;
        //this.template.querySelector('.cube').style.animation = `spin 5s linear infinite`;
    }

    rotateCube(dx, dy) {
        // Calculate the rotation based on the drag movement
        // This is a simplified example. You might need to adjust the calculations based on your specific requirements.
        const rotationX = dy * -1; // Adjust the multiplier as needed
        const rotationY = dx * 1; // Adjust the multiplier as needed
        this.template.querySelector('.cube').style.transform += `rotateX(${rotationX}deg) rotateY(${rotationY}deg)`;
    }
}
