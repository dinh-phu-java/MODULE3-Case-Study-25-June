package dinhphu.codegym.model;

public class Product {
    int car_id;
    int user_id;
    String image_id;
    String engine_type;
    String gear;
    String front_wheel;
    String fuel_type;
    String valves;
    double car_price;
    String description;
    String post_date;
    String date_of_manufacture;
    String vendor;
    String car_type;
    String car_name;

    public Product(int car_id, int user_id, String image_id, String engine_type, String gear, String front_wheel, String fuel_type, String valves, double car_price, String description, String post_date, String date_of_manufacture, String vendor, String car_type, String car_name) {
        this.car_id = car_id;
        this.user_id = user_id;
        this.image_id = image_id;
        this.engine_type = engine_type;
        this.gear = gear;
        this.front_wheel = front_wheel;
        this.fuel_type = fuel_type;
        this.valves = valves;
        this.car_price = car_price;
        this.description = description;
        this.post_date = post_date;
        this.date_of_manufacture = date_of_manufacture;
        this.vendor = vendor;
        this.car_type = car_type;
        this.car_name=car_name;
    }

    public Product(int user_id, String image_id, String engine_type, String gear, String front_wheel, String fuel_type, String valves, double car_price, String description, String post_date, String date_of_manufacture, String vendor, String car_type, String car_name) {
        car_id=0;
        this.user_id = user_id;
        this.image_id = image_id;
        this.engine_type = engine_type;
        this.gear = gear;
        this.front_wheel = front_wheel;
        this.fuel_type = fuel_type;
        this.valves = valves;
        this.car_price = car_price;
        this.description = description;
        this.post_date = post_date;
        this.date_of_manufacture = date_of_manufacture;
        this.vendor = vendor;
        this.car_type = car_type;
        this.car_name=car_name;
    }

    public String getCar_name() {
        return car_name;
    }

    public void setCar_name(String car_name) {
        this.car_name = car_name;
    }

    public int getCar_id() {
        return car_id;
    }

    public void setCar_id(int car_id) {
        this.car_id = car_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getImage_id() {
        return image_id;
    }

    public void setImage_id(String image_id) {
        this.image_id = image_id;
    }

    public String getEngine_type() {
        return engine_type;
    }

    public void setEngine_type(String engine_type) {
        this.engine_type = engine_type;
    }

    public String getGear() {
        return gear;
    }

    public void setGear(String gear) {
        this.gear = gear;
    }

    public String getFront_wheel() {
        return front_wheel;
    }

    public void setFront_wheel(String front_wheel) {
        this.front_wheel = front_wheel;
    }

    public String getFuel_type() {
        return fuel_type;
    }

    public void setFuel_type(String fuel_type) {
        this.fuel_type = fuel_type;
    }

    public String getValves() {
        return valves;
    }

    public void setValves(String valves) {
        this.valves = valves;
    }

    public double getCar_price() {
        return car_price;
    }

    public void setCar_price(double car_price) {
        this.car_price = car_price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPost_date() {
        return post_date;
    }

    public void setPost_date(String post_date) {
        this.post_date = post_date;
    }

    public String getDate_of_manufacture() {
        return date_of_manufacture;
    }

    public void setDate_of_manufacture(String date_of_manufacture) {
        this.date_of_manufacture = date_of_manufacture;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    public String getCar_type() {
        return car_type;
    }

    public void setCar_type(String car_type) {
        this.car_type = car_type;
    }
}
