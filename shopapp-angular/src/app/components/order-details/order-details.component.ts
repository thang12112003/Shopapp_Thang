import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { OrderService } from '../../services/order.service';
import { HeaderComponent } from '../header/header.component';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-order-details',
  templateUrl: './order-details.component.html',
  styleUrls: ['./order-details.component.scss'],
  standalone: true,
  imports: [
    HeaderComponent,
    CommonModule,
    FormsModule,
  ]
})
export class OrderDetailsComponent implements OnInit {
  orderId: number = 0;
  orderResponse: any = {
    id: 0,
    user: {
      id: 0,
      fullName: '',
      phoneNumber: '',
      email: '',
      address: '',
    },
    note: '',
    orderDate: new Date(),
    status: '',
    orderDetails: [],
  };

  constructor(private route: ActivatedRoute, private orderService: OrderService) {}

  ngOnInit(): void {
    this.getOrderDetails();
  }

  getOrderDetails(): void {
    this.orderId = Number(this.route.snapshot.paramMap.get('id'));
    this.orderService.getOrderById(this.orderId).subscribe({
      next: (response: any) => {
        this.orderResponse = response;
        console.log( this.orderResponse)
      },
      error: (error: any) => {
        console.error('Error fetching detail:', error);
      },
    });
  }
}
