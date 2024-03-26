from flask import Flask, jsonify, request
import requests

app = Flask(__name__)

# Thay thế 'YOUR_API_KEY' bằng API key của bạn từ OpenWeatherMap
API_KEY = 'c58a741e9fefadeaf6215354d2864b4f'
BASE_URL = 'http://api.openweathermap.org/data/2.5/weather'

# Route để lấy thông tin thời tiết dựa trên tên thành phố
@app.route('/weather', methods=['GET'])
def get_weather():
    city = request.args.get('city')

    if not city:
        return jsonify({'error': 'Missing city parameter'}), 400

    params = {
        'q': city,
        'appid': API_KEY,
        'units': 'metric'  # Để lấy nhiệt độ theo độ Celsius
    }

    response = requests.get(BASE_URL, params=params)
    data = response.json()

    if response.status_code != 200:
        return jsonify({'error': 'Failed to fetch weather data'}), response.status_code

    weather_data = {
        'city': data['name'],
        'temperature': data['main']['temp'],
        'description': data['weather'][0]['description']
    }

    return jsonify(weather_data)

if _name_ == '__main__':
    app.run(debug=True)
