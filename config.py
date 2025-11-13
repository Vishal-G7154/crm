import os   #used to read environment variables, file paths, etc
class Config:       #user defined class
    SQLALCHEMY_DATABASE_URI = "postgresql://crm_user:123@localhost:5432/crm_db" # prdefined name  SQLALCHEMY_DATABASE_URI  i.e tells SQLAlchemy which database to connect to and how
    SQLALCHEMY_TRACK_MODIFICATIONS = False  #It tells SQLAlchemy whether to track changes to objects for signals.
                                            # Setting it to False is recommended (otherwise it shows a warning and uses extra memory).

    

