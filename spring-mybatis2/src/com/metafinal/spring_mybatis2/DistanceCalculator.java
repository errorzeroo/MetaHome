package com.metafinal.spring_mybatis2;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;

import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class DistanceCalculator {

    // Haversine 거리 계산 함수
    public static double haversine(double lat1, double lon1, double lat2, double lon2) {
        final int R = 6371; // 지구 반지름 (단위: km)

        // 위도, 경도를 라디안으로 변환
        double lat1Rad = Math.toRadians(lat1);
        double lon1Rad = Math.toRadians(lon1);
        double lat2Rad = Math.toRadians(lat2);
        double lon2Rad = Math.toRadians(lon2);

        // 위도, 경도 차이 계산
        double dLat = lat2Rad - lat1Rad;
        double dLon = lon2Rad - lon1Rad;

        // Haversine 공식
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                + Math.cos(lat1Rad) * Math.cos(lat2Rad)
                * Math.sin(dLon / 2) * Math.sin(dLon / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

        // 거리 계산
        return R * c;
    }

    // CSV 파일에서 위도, 경도 추출
    public static List<Location> readCSV(String filePath) throws IOException {
        List<Location> locations = new ArrayList<>();
        FileReader reader = new FileReader(filePath);
        CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT.withHeader());

        // CSV 파일에서 각 지점의 위도, 경도 읽기
        for (CSVRecord record : csvParser) {
            double latitude = Double.parseDouble(record.get("latitude"));
            double longitude = Double.parseDouble(record.get("longitude"));
            locations.add(new Location(latitude, longitude));
        }

        csvParser.close();
        return locations;
    }

    public static void main(String[] args) throws IOException {
        // 여러 CSV 파일 경로
        String[] files = {"locations1.csv", "locations2.csv"};

        // 각 파일에 대해 처리
        for (String file : files) {
            System.out.println("Processing file: " + file);
            List<Location> locations = readCSV(file);

            // 각 파일의 첫 번째 지점과 나머지 지점들 간의 거리 계산
            for (int i = 0; i < locations.size(); i++) {
                Location loc1 = locations.get(i);

                for (int j = i + 1; j < locations.size(); j++) {
                    Location loc2 = locations.get(j);
                    double distance = haversine(loc1.latitude, loc1.longitude, loc2.latitude, loc2.longitude);
                    System.out.println("Distance between point " + (i + 1) + " and point " + (j + 1) + " is: " + distance + " km");
                }
            }
        }
    }

    // Location 클래스: 위도, 경도를 저장
    static class Location {
        double latitude;
        double longitude;

        Location(double latitude, double longitude) {
            this.latitude = latitude;
            this.longitude = longitude;
        }
    }
}
