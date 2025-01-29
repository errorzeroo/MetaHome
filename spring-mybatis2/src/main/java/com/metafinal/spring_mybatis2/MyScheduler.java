package com.metafinal.spring_mybatis2;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class MyScheduler {

    // 2월 28일 밤 12시(자정)에 동작
    @Scheduled(cron = "0 0 0 28 2 ?")
    public void runOnFeb28Midnight() {
        try {
            // 파이썬 파일 실행
            ProcessBuilder processBuilder = new ProcessBuilder(
                    "python", "C:\\Lecture\\final\\school.py"
            );

            // 프로세스 실행
            Process process = processBuilder.start();

            // 프로세스의 종료 코드 확인 (0: 성공)
            int exitCode = process.waitFor();
            if (exitCode == 0) {
                System.out.println("파이썬 스크립트가 성공적으로 실행되었습니다.");
            } else {
                System.err.println("파이썬 스크립트 실행 중 오류가 발생했습니다. 종료 코드: " + exitCode);
            }

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
            System.err.println("파이썬 스크립트를 실행하는 중 예외가 발생했습니다: " + e.getMessage());
        }
    }

    // 8월 30일 밤 12시(자정)에 동작
    @Scheduled(cron = "0 0 0 30 8 ?")
    public void runOnAug30Midnight() {
        try {
            // 파이썬 파일 실행
            ProcessBuilder processBuilder = new ProcessBuilder(
                    "python", "C:\\Lecture\\final\\school.py"
            );

            // 프로세스 실행
            Process process = processBuilder.start();

            // 프로세스의 종료 코드 확인 (0: 성공)
            int exitCode = process.waitFor();
            if (exitCode == 0) {
                System.out.println("파이썬 스크립트가 성공적으로 실행되었습니다.");
            } else {
                System.err.println("파이썬 스크립트 실행 중 오류가 발생했습니다. 종료 코드: " + exitCode);
            }

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
            System.err.println("파이썬 스크립트를 실행하는 중 예외가 발생했습니다: " + e.getMessage());
        }
    }

    // 2주마다 동작 (14일 간격)
    @Scheduled(cron = "0 0 0 */14 * ?")
    public void runEveryTwoWeeks() {
        try {
            // 파이썬 파일 실행
            ProcessBuilder processBuilder = new ProcessBuilder(
                    "python", "C:\\Lecture\\final\\bus.py"
            );

            // 프로세스 실행
            Process process = processBuilder.start();

            // 프로세스의 종료 코드 확인 (0: 성공)
            int exitCode = process.waitFor();
            if (exitCode == 0) {
                System.out.println("파이썬 스크립트가 성공적으로 실행되었습니다.");
            } else {
                System.err.println("파이썬 스크립트 실행 중 오류가 발생했습니다. 종료 코드: " + exitCode);
            }

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
            System.err.println("파이썬 스크립트를 실행하는 중 예외가 발생했습니다: " + e.getMessage());
        }

        try {
            // 파이썬 파일 실행
            ProcessBuilder processBuilder = new ProcessBuilder(
                    "python", "C:\\Lecture\\final\\subway.py"
            );

            // 프로세스 실행
            Process process = processBuilder.start();

            // 프로세스의 종료 코드 확인 (0: 성공)
            int exitCode = process.waitFor();
            if (exitCode == 0) {
                System.out.println("파이썬 스크립트가 성공적으로 실행되었습니다.");
            } else {
                System.err.println("파이썬 스크립트 실행 중 오류가 발생했습니다. 종료 코드: " + exitCode);
            }

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
            System.err.println("파이썬 스크립트를 실행하는 중 예외가 발생했습니다: " + e.getMessage());
        }
    }

    // 1달마다 동작 (매월 1일 자정에 실행)
    @Scheduled(cron = "0 0 0 1 * ?")
    public void runEveryMonth() {
        try {
            // 파이썬 파일 실행
            ProcessBuilder processBuilder = new ProcessBuilder(
                    "python", "C:\\Lecture\\final\\park.py"
            );

            // 프로세스 실행
            Process process = processBuilder.start();

            // 프로세스의 종료 코드 확인 (0: 성공)
            int exitCode = process.waitFor();
            if (exitCode == 0) {
                System.out.println("파이썬 스크립트가 성공적으로 실행되었습니다.");
            } else {
                System.err.println("파이썬 스크립트 실행 중 오류가 발생했습니다. 종료 코드: " + exitCode);
            }

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
            System.err.println("파이썬 스크립트를 실행하는 중 예외가 발생했습니다: " + e.getMessage());
        }

        try {
            // 파이썬 파일 실행
            ProcessBuilder processBuilder = new ProcessBuilder(
                    "python", "C:\\Lecture\\final\\parking.py"
            );

            // 프로세스 실행
            Process process = processBuilder.start();

            // 프로세스의 종료 코드 확인 (0: 성공)
            int exitCode = process.waitFor();
            if (exitCode == 0) {
                System.out.println("파이썬 스크립트가 성공적으로 실행되었습니다.");
            } else {
                System.err.println("파이썬 스크립트 실행 중 오류가 발생했습니다. 종료 코드: " + exitCode);
            }

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
            System.err.println("파이썬 스크립트를 실행하는 중 예외가 발생했습니다: " + e.getMessage());
        }

        try {
            // 파이썬 파일 실행
            ProcessBuilder processBuilder = new ProcessBuilder(
                    "python", "C:\\Lecture\\final\\hospital.py"
            );

            // 프로세스 실행
            Process process = processBuilder.start();

            // 프로세스의 종료 코드 확인 (0: 성공)
            int exitCode = process.waitFor();
            if (exitCode == 0) {
                System.out.println("파이썬 스크립트가 성공적으로 실행되었습니다.");
            } else {
                System.err.println("파이썬 스크립트 실행 중 오류가 발생했습니다. 종료 코드: " + exitCode);
            }

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
            System.err.println("파이썬 스크립트를 실행하는 중 예외가 발생했습니다: " + e.getMessage());
        }
    }


}
