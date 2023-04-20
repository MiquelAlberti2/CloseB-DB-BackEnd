from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


products = Blueprint('products', __name__)

# Get all the products from the database
@products.route('/products', methods=['GET'])
def get_products():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT ProductID, Name, Description, Price, BrandID FROM Products')

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# get the top 5 products from the database
@products.route('/mostExpensive')
def get_most_pop_products():
    cursor = db.get_db().cursor()
    query = '''
        SELECT product_code, product_name, list_price, reorder_level
        FROM products
        ORDER BY list_price DESC
        LIMIT 5
    '''
    cursor.execute(query)
       # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


@products.route('/Review_made', methods=['GET'])
def get_review_made():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT ProductID, n_stars, comment FROM Review_made')

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

@products.route('/Review_made/CustomerID', methods=['GET'])
def get_review_made_with_customerID():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT CustomerID, ProductID, n_stars, comment FROM Review_made')

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

@products.route('/products/<ProductID>', methods=['PUT'])
def update_product(ProductID):

    the_data = request.json

    #extract the values
    price = the_data['Price']
    name = the_data['Name']
    categoryTitle = the_data['CategoryTitle']
    description = the_data['Description']
    

    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('UPDATE Products SET Price = '+str(price)+ ' Name = '+str(name)+ ' CategoryTitle = '+str(categoryTitle)+ '  Description = '+str(description)+ ' WHERE ProductID = '+str(ProductID))

    db.get_db().commit()

    return "Success!"

@products.route('/CategoryTitle', methods=['GET'])
def get_CategoryTitle():
    cursor = db.get_db().cursor()

    query = '''
    SELECT Title AS label, Title AS value
    FROM Categories
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

@products.route('/productdetails', methods=['POST'])
def add_new_product_details():

    the_data = request.json

    #extract the values I need
    #shipping_cost = the_data['ShippingCost']
    Name = the_data['Name']
    Description = the_data['Description']
    Price = the_data['Price']
    Category_Title = the_data['Category_Title']
    BrandID = the_data['BrandID']


    # write the SQL query to put the info into the database
    the_query = "INSERT into Products (Name, Description, Category_Title, BrandID, Price)"
    the_query += " values ( '"
    the_query += str(Name) + "', '"
    the_query += str(Description) + "', '"
    the_query += str(Category_Title) + "',"
    the_query += str(BrandID) + ","
    the_query += str(Price) + " )"

    # to debug in Docker (to show it in the Docker terminal)
    current_app.logger.info(the_query)

    # insert data into the database
    cursor = db.get_db().cursor()
    cursor.execute(the_query)
    db.get_db().commit() # to apply the changes to the database

    return 'Success!'

# Delete the products with certain ProductID from the database
@products.route('/productsdelete/<ProductID>', methods=['DELETE'])
def delete_products(ProductID):
    
    # get a cursor object from the database
    cursor = db.get_db().cursor()
    # use cursor to query the database for deleting a product
    cursor.execute("DELETE FROM Products WHERE ProductID = "+str(ProductID))
    db.get_db().commit() # to apply the changes to the database

    return 'Success!'