from flask import Blueprint, request, jsonify, make_response
import json
from src import db


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