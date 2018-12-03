import cx_Oracle

# method to receive each row as a named tuple
def makeNamedTupleFactory(cursor):
    columnNames = [d[0].lower() for d in cursor.description]
    import collections
    Row = collections.namedtuple('Row', columnNames)
    return Row

# method to receive each row as a dictionary
def makeDictFactory(cursor):
    columnNames = [d[0] for d in cursor.description]
    def createRow(*args):
        return dict(zip(columnNames, args))
    return createRow

'''
    Function that takes the sqlCommand and connectString 
    and retuns the output and error string (if any)
'''
from subprocess import Popen, PIPE
def runSqlQuery(sqlCommand, connectString):
    session = Popen(['sqlplus', '-S', connectString], stdin=PIPE, stdout=PIPE, stderr=PIPE)
    session.stdin.write(sqlCommand)
    return session.communicate()
connstr = 'student/student@//localhost:1521/xe'
'''
    Usage:
    output, error = runSqlQuery("@schema.sql".encode('utf-8'), connstr)
    print(output)
    print(error)
'''

# Function to verify login
def verifyLogin(id, password, type='student'):
    if type == "student":

        query = "SELECT * FROM STUDENT_LOGIN WHERE STUDENT_ID = " + id + " AND STUDENT_PASS = " + password

        output, error = runSqlQuery(query, connstr);

        print(output)
        print(error)

if __name__ == "__main__":
    con = cx_Oracle.connect('student/student@//localhost:1521/xe')
    # print(con.version)
    cur = con.cursor()
    # result = cur.execute("select * from student")

    # use the following statement after execute to receive each row as a named tuple
    # cur.rowfactory = makeNamedTupleFactory(cur)

    # use the following statement after execute to receive each row as a dictionary
    # cur.rowfactory = makeDictFactory(cur)

    # for i in result:
    #     print(i)

    con.close()