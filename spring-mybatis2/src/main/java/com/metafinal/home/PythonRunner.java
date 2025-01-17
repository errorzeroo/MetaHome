package com.metafinal.home;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

public class PythonRunner {

    public String runPythonScript(String columns, String values) {
        try {
            // Python 실행 파일 경로
            String exePath = new File(getClass().getClassLoader().getResource("similarity.exe").toURI()).getAbsolutePath();
            String csvPath = new File(getClass().getClassLoader().getResource("scaleResult.csv").toURI()).getAbsolutePath();

            // ProcessBuilder 명령어 설정
            String[] command = { exePath, csvPath, columns, values };

            System.out.println("ProcessBuilder 명령어:");
            for (String cmd : command) {
                System.out.println(cmd);
            }

            // Python 실행
            ProcessBuilder processBuilder = new ProcessBuilder(command);
            processBuilder.redirectErrorStream(true); // 에러를 출력으로 병합
            Process process = processBuilder.start();

            // Python 실행 결과 읽기
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8));
            StringBuilder result = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                result.append(line);
            }

            // 에러 스트림 읽기
            BufferedReader errorReader = new BufferedReader(new InputStreamReader(process.getErrorStream(), StandardCharsets.UTF_8));
            StringBuilder errorOutput = new StringBuilder();
            String errorLine;
            while ((errorLine = errorReader.readLine()) != null) {
                errorOutput.append(errorLine);
            }
            if (errorOutput.length() > 0) {
                System.err.println("Python 실행 중 에러 발생: " + errorOutput);
            }

            System.out.println("Python 실행 결과: " + result.toString());
            process.waitFor();

            return result.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
