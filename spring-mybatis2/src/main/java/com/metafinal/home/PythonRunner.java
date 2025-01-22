package com.metafinal.home;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class PythonRunner {

    public String runPythonScript(String address, String homeKind, String columns, String values) {
        try {
            // Python 실행 명령어 설정
            String pythonScriptPath = "C:\\Lecture\\final\\similar2.py"; // Python 스크립트 절대 경로
            String[] command = {
                    "python", // Python 실행 명령
                    pythonScriptPath,
                    address,
                    homeKind,
                    columns, // 사용자 입력 컬럼
                    values   // 사용자 입력 값
            };

            // Python 스크립트 실행
            ProcessBuilder processBuilder = new ProcessBuilder(command);
            processBuilder.redirectErrorStream(true);
            Process process = processBuilder.start();

            // Python 출력 읽기
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            StringBuilder result = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                result.append(line);
            }

            // 프로세스 종료 대기
            process.waitFor();

            // Python 실행 결과 반환
            return result.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

