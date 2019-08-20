from flask import Flask, jsonify, request 
from flask_cors import CORS
from datetime import date, datetime
import mysql.connector

app = Flask(__name__)
CORS(app)
db_connect = mysql.connector.connect(user='root', password='', host='localhost', database='vuma_installations')

@app.route('/installation/all', methods = ['GET'])
def get_installation():
    try:
        command = db_connect.cursor()
        stmt = 'select inst.id, inst.customer_name, inst.address, inst.appointment_date, st.status, inst.date_modified from installation as inst left join status as st on inst.status_id = st.id order by inst.date_modified desc'
        command.execute(stmt)
        installations = command.fetchall()        
        return jsonify({'response': [dict(zip([key[0] for key in command.description], row)) for row in installations]})
    except Exception as error:
        return jsonify({'response':[{'code': 500, 'message' : 'Sever error occured while fetching installations: '+ str(error)}]})    

@app.route('/create/installation', methods = ['POST'])
def create_inst():
    customer_name = request.json['customer_name']
    address = request.json['address']
    appointment_date = request.json['appointment_date']
    appointment_time = request.json['appointment_time'] 
    status_id = request.json['status_id']
    if (customer_name == "" or address == "" or  appointment_date == "" or status_id == ""):
        return jsonify({'response':[{'code': 500, 'message' : 'Please complete all required fields'}]})
    else:
        try:
            appointment_date = datetime(int(appointment_date[0:4]), int(appointment_date[5:7]), int(appointment_date[8:10]), int(appointment_time[0:1]), int(appointment_time[3:5]))
            command = db_connect.cursor()
            stmt = 'insert into installation (customer_name, address, appointment_date, status_id) values (%s, %s, %s, %s)'
            values = (customer_name, address, appointment_date, status_id)
            command.execute(stmt, values)
            db_connect.commit(); 
            if (command.lastrowid > 0):
                return jsonify({'response':[{'code': 200, 'message' : 'Installation created successfully'}]})
            else:
                return jsonify({'response':[{'code': 500, 'message' : 'Unable to create installation'}]})
            command.close()
        except Exception as error:
            return jsonify({'response':[{'code': 500, 'message' : 'Sever error occured while creating installation: '+ str(error)}]})

@app.route('/create/installation/<int:installation_id>', methods = ['PUT'])    
def update_inst(installation_id):
    customer_name = request.json['customer_name']
    address = request.json['address']
    appointment_date = request.json['appointment_date']
    appointment_time = request.json['appointment_time']
    status_id = request.json['status_id']
    if (customer_name == "" or address == "" or  appointment_date == "" or status_id == ""):
        return jsonify({'response':[{'code': 500, 'message' : 'Please complete all required fields'}]})
    else:
        try:
            appointment_date = datetime(int(appointment_date[0:4]), int(appointment_date[5:7]), int(appointment_date[8:10]), int(appointment_time[0:1]), int(appointment_time[3:5]))
            command = db_connect.cursor()
            stmt = 'update installation set customer_name=%s, address=%s, appointment_date=%s, status_id=%s, date_modified=%s where id = %s'
            values = (customer_name, address, appointment_date, status_id, datetime.now(), installation_id)
            command.execute(stmt, values)
            db_connect.commit(); 
            if (command.rowcount > 0):
                return jsonify({'response':[{'code': 200, 'message' : 'Installation updated successfully'}]})
            else:
                return jsonify({'response':[{'code': 500, 'message' : 'Unable to update installation'}]})
            command.close()
        except Exception as error:
            return jsonify({'response':[{'code': 500, 'message' : 'Sever error occured while updating installation: '+ str(error)}]})

@app.route('/lists/statuses', methods = ['GET'])  
def get_statuses():
    try:
        command = db_connect.cursor()
        stmt = 'select * from status'
        command.execute(stmt)
        statuses = command.fetchall() 
        return jsonify({'response': [dict(zip([key[0] for key in command.description], row)) for row in statuses]})
    except Exception as error:
        return jsonify({'response':[{'code': 500, 'message' : 'Sever error occured while fetching lists: '+ str(error)}]})

app.run(debug=True)