import { NgModule, importProvidersFrom } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CommonModule } from '@angular/common';
import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { RegisterComponent } from './components/register/register.component';
import {
  DetailProductComponent
} from './components/detail-product/detail-product.component';
import { OrderComponent } from './components/order/order.component';
import { MyOrderComponent } from './components/my_order/myorder.component';
import { OrderDetailComponent } from './components/detail-order/order.detail.component';
import { UserProfileComponent } from './components/user-profile/user.profile.component';
import { AdminComponent } from './components/admin/admin.component';
import { AuthGuardFn } from './guards/auth.guard';
import { AdminGuardFn } from './guards/admin.guard';
import {OrderDetailsComponent} from'./components/order-details/order-details.component'
//import { OrderAdminComponent } from './components/admin/order/order.admin.component';

export const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'products/:id', component: DetailProductComponent },
  { path: 'orders', component: OrderComponent,canActivate:[AuthGuardFn] },
  { path: 'my_orders', component: MyOrderComponent,canActivate:[AuthGuardFn] },
  { path: 'order-details/:id', component: OrderDetailsComponent },
  { path: 'user-profile', component: UserProfileComponent, canActivate:[AuthGuardFn] },
  { path: 'orders/:id', component: OrderDetailComponent },
  //Admin
  {
    path: 'admin',
    component: AdminComponent,
    canActivate:[AdminGuardFn]
  },
];
