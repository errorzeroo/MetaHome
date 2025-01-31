package com.metafinal.spring_mybatis2;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class MyScheduler {

    // 2월 28일 밤 12시(자정)에 동작
    @Scheduled(cron = "0 0 0 28 2 ?")
    public void runOnFeb28Midnight() {
        executePythonScript("C:\\Lecture\\final\\school.py");
    }

    // 8월 30일 밤 12시(자정)에 동작
    @Scheduled(cron = "0 0 0 30 8 ?")
    public void runOnAug30Midnight() {
        executePythonScript("C:\\Lecture\\final\\school.py");
    }

    // 2주마다 동작 (14일 간격)
    @Scheduled(cron = "0 0 0 */14 * ?")
    public void runEveryTwoWeeks() {
        executePythonScript("C:\\Lecture\\final\\bus.py");
        executePythonScript("C:\\Lecture\\final\\subway.py");
    }

    // 1달마다 동작 (매월 1일 자정에 실행)
    @Scheduled(cron = "0 0 0 1 * ?")
    public void runEveryMonth() {
        executePythonScript("C:\\Lecture\\final\\park.py");
        executePythonScript("C:\\Lecture\\final\\parking.py");
        executePythonScript("C:\\Lecture\\final\\hospital.py");
    }

    // 매일 자정에 실행
    @Scheduled(cron = "0 0 0 * * ?")
    public void runEveryDay() {
        executePythonScript("C:\\Lecture\\final\\home.py");
    }

    private void executePythonScript(String scriptPath) {
        try {
            ProcessBuilder processBuilder = new ProcessBuilder("python", scriptPath);
            Process process = processBuilder.start();
            int exitCode = process.waitFor();
            if (exitCode == 0) {
                System.out.println("파이썬 스크립트가 성공적으로 실행되었습니다: " + scriptPath);
            } else {
                System.err.println("파이썬 스크립트 실행 중 오류가 발생했습니다. 종료 코드: " + exitCode + ", 경로: " + scriptPath);
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
            System.err.println("파이썬 스크립트를 실행하는 중 예외가 발생했습니다: " + e.getMessage());
        }
    }
}
