from flask import Blueprint, request, current_app, jsonify, make_response
import json
from src import db

# FOR PERSONA1 - Marketplace Admin
# TODO: Rename file if this is the only Blueprint we use for this persona

orders = Blueprint('orders', __name__)

# Get all orders from the DB
@orders.route('/orders', methods=['GET'])
def get_orders():
    cursor = db.get_db().cursor()

    query = '''
    SELECT OrderID, CustomerID, Price,
    CASE
        WHEN OrderID IN (SELECT OrderID
                        FROM Shipments) THEN 'True'
        ELSE 'False'
    END AS Fulfilled
    FROM Orders
    WHERE isReturn = 0
    '''
    cursor.execute(query)
    
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))

    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'

    return the_response

# Get all returns from the DB
@orders.route('/returns', methods=['GET'])
def get_returns():
    cursor = db.get_db().cursor()

    query = '''
    SELECT OrderID, CustomerID, Price,
    CASE
        WHEN OrderID IN (SELECT OrderID
                        FROM Shipments) THEN 'True'
        ELSE 'False'
    END AS Fulfilled
    FROM Orders
    WHERE isReturn = 1
    '''
    cursor.execute(query)
    
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))

    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'

    return the_response

# Get all carriers from the DB
@orders.route('/carriersID', methods=['GET'])
def get_carriersID():
    cursor = db.get_db().cursor()

    query = '''
    SELECT CarrierID AS label, CarrierID AS value
    FROM Carriers
    '''
    cursor.execute(query)
    
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))

    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'

    return the_response


# Get all order shipments from the DB
@orders.route('/shipments/orders', methods=['GET'])
def get_order_shipments():
    cursor = db.get_db().cursor()

    query = '''
    SELECT ShipmentID, ShippingCost, CarrierID, OrderID
    FROM Shipments
    WHERE OrderID IN (SELECT OrderID
                      FROM Orders
                      WHERE isReturn = 0)
    '''
    cursor.execute(query)
    
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))

    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'

    return the_response

# Get all order returns from the DB
@orders.route('/shipments/returns', methods=['GET'])
def get_return_shipments():
    cursor = db.get_db().cursor()

    query = '''
    SELECT ShipmentID, ShippingCost, CarrierID, OrderID
    FROM Shipments
    WHERE OrderID IN (SELECT OrderID
                      FROM Orders
                      WHERE isReturn = 1)
    '''
    cursor.execute(query)
    
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))

    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'

    return the_response


@orders.route('/shipments', methods=['POST'])
def add_new_shipment():

    the_data = request.json

    #extract the values I need
    shipping_cost = the_data['ShippingCost']
    carrier_ID = the_data['CarrierID']
    order_ID = the_data['OrderID']

    # write the SQL query to put the info into the database
    the_query = "INSERT into Shipments (ShippingCost, CarrierID, OrderID)"
    the_query += "values ('"
    the_query += str(shipping_cost) + "', "
    the_query += str(carrier_ID) + ", "
    the_query += str(order_ID) + ")"

    # to debug in Docker (to show it in the Docker terminal)
    current_app.logger.info(the_query)

    # insert data into the database
    cursor = db.get_db().cursor()
    cursor.execute(the_query)
    db.get_db().commit() # to apply the changes to the database

    return 'Success!'

# Get price for a given shipment
@orders.route('/shipment/price', methods=['GET'])
def get_shipment_price():

    the_data = request.json

    # extract the values I need
    carrier_ID = the_data['CarrierID']
    customer_ID = the_data['CustomerID']

    # look for the result in the database
    query  = "SELECT Price FROM Carrier_rates"
    query += " WHERE CarrierID = "+str(carrier_ID)
    query += " AND ZIP = (SELECT ZIP FROM Customers"
    query +=            " WHERE CustomerID = "+ str(customer_ID) +" )"
    
    cursor = db.get_db().cursor()
    cursor.execute(query)

    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))

    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'

    return the_response
