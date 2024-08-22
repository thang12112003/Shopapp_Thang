import { Component, OnInit } from '@angular/core';
import { inject } from '@angular/core';
import { HeaderComponent } from '../header/header.component';
import { FooterComponent } from '../footer/footer.component';
import { TokenService } from '../../services/token.service';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MyOrderService } from '../../services/my_order.service';
import { MyOrder } from '../../responses/order/myorder.response';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-myorder',
  templateUrl: './myorder.component.html',
  styleUrls: ['./myorder.component.scss'],
  standalone: true,
  imports: [
    FooterComponent,
    HeaderComponent,
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
  ]
})
export class MyOrderComponent  implements OnInit {
  private tokenService = inject(TokenService);

  orders: MyOrder[] = [];
  userId: number = 5;
  token:string =""

  constructor(
    private myOrderService: MyOrderService,  // Đổi thành myOrderService
    private route: ActivatedRoute,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.userId = Number(this.tokenService.getUserId());
    this.token = localStorage.getItem('access_token') || ''; // Lấy token từ localStorage
    this.getAllOrders(this.userId);
    // console.log(this.userId)
}

getAllOrders(userId: number) {
  this.myOrderService.getOrdersByUser(userId, this.token).subscribe({
    next: (response: any) => {
      if (Array.isArray(response)) {
        // Nếu response là một mảng đơn hàng
        this.orders = response;
      } else if (response && response.order_details) {
        // Nếu response là một đối tượng đơn hàng với thuộc tính order_details
        this.orders = [response];
      } else {
        console.error('API response is not in the expected format:', response);
        this.orders = [];
      }
      console.log(this.orders)
    },
    error: (error: any) => {
      console.error('Error fetching orders:', error);
    }
  });
}


trackByOrderId(index: number, order: any): number {
  return order.id;
}

viewOrderDetails(orderId: number): void {
  // Điều hướng đến trang chi tiết hoặc mở modal để hiển thị chi tiết đơn hàng
  this.router.navigate(['/order-details', orderId]); // Ví dụ sử dụng điều hướng
}
}
