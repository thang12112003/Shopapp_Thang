export interface MyOrder {
  id: number;
  user_id: number;
  fullName:string;
  email: string;
  phoneNumber: string;
  address: string;
  note: string;
  orderDate: Date;
  status: string;
  totalMoney: number;
  user: {
    id: number;
    fullName: string;
    phoneNumber: string;
    address: string;
  }
}
