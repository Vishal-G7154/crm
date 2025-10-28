import pytest
from app import create_app, db

@pytest.fixture
def app():
    app = create_app("config.settings.DevConfig")
    app.config["TESTING"] = True
    app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///:memory:"
    
    with app.app_context():
        db.create_all()
        yield app
        db.drop_all()

@pytest.fixture
def client(app):
    return app.test_client()

def test_health_endpoint(client):
    response = client.get("/api/health")
    assert response.status_code == 200
    assert response.json["status"] == "ok"

def test_index_page(client):
    response = client.get("/")
    assert response.status_code == 200
