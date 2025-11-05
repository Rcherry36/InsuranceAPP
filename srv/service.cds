
using insuranceApp as ip from '../db/schema';  // path to your data model
//@path:'/insurance-App'
//@requires:'athenticator-user'{nakkacharan04@gmail.com'}
//@requires:'Admin'
using { Northwind } from './external/Northwind';

service northwindService{
   entity Products as projection on Northwind.Products;
    entity Regions as projection on Northwind.Regions;

}
service InsuranceService {
    
    //@requires:'customers'
    entity Customers as projection on ip.Customers;

    entity Policies  as projection on ip.Policies;

    entity Agents    as projection on ip.Agents;

    entity Claims    as projection on ip.Claims;

    entity Payments  as projection on ip.Payments;



    //unbound function
    //function getAllCustomersData ()returns array of{};
    //bound action
    //action insertNewDataCustomers() returns String;
    
}