import { Injectable } from '@angular/core';
import {
  HttpClient,
  HttpParams,
  HttpHeaders
} from '@angular/common/http';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root',
})
export class MyOrderService {

  private apiUrl = 'http://localhost:8088/api/v1/orders/user';

  constructor(private http: HttpClient) { }

  getOrdersByUser(userId: number, token: string): Observable<any> {
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });

    return this.http.get<any>(`${this.apiUrl}/${userId}`, { headers });
  }
}
