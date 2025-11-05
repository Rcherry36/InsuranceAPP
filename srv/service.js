const cds = require('@sap/cds');
const { UPDATE } = require('@sap/cds/lib/ql/cds-ql');
//const { DELETE } = require('@sap/cds/lib/ql/cds-ql');
//const { results } = require('@sap/cds/lib/utils/cds-utils');

module.exports = cds.service.impl (async function (){
  this.on('getCustomerByID', async (req) => {
    const ID = 5; 
    console.log(`Fetching customer with ID: ${ID}`);

    const result = await SELECT.one.from(Customers).where({ ID });


})
 this.on('UPDATE', 'Customers', async (req) => {
    const { id, firstName } = req.data;
    console.log("firstname",firstName);
    const { Customers } = cds.entities('insuranceApp');

    if (!id) return req.error(400, 'Missing ID');
    if (!firstName) return req.error(400, 'Please provide firstName to update');

    // Update the firstName for given ID
    // const result = await UPDATE(Customers)
    //   .set({firstName:firstName })
    //   .where({ id: id });

    // if (result === 0) return req.error(404, `Customer with ID ${id} not found`);

    // Return updated record
    // const updated = await SELECT.one.from(Customers).where({ id });
    // return updated;
 })


    const Northwind = await cds.connect.to('Northwind');``
    const { Orders } = Northwind.entities;
    const ordersData = await Northwind.run(SELECT(Orders).limit(5));
    console.log("OrdersData", ordersData); 

     this.on('READ', 'Products', async (req) => {
        console.log("inside edmx northwind");
        console.log("req.query", req.query);
        return Northwind.run(req.query);
    })
});
