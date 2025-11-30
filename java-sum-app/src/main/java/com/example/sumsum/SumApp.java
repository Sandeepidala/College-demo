package com.example.sumsum;

import java.util.Scanner;

public class SumApp {
    public static void main(String[] args) {
        double a = 0, b = 0;
        boolean gotA = false, gotB = false;

        // If two command-line arguments provided, try to parse them
        if (args.length >= 2) {
            try {
                a = Double.parseDouble(args[0]);
                b = Double.parseDouble(args[1]);
                gotA = gotB = true;
            } catch (NumberFormatException e) {
                System.err.println("Command-line arguments must be numbers. Falling back to interactive input.");
            }
        }

        // If not able to use args, prompt for inputs
        Scanner scanner = new Scanner(System.in);
        try {
            if (!gotA) {
                System.out.print("Enter first number: ");
                while (true) {
                    String line = scanner.nextLine();
                    try {
                        a = Double.parseDouble(line.trim());
                        break;
                    } catch (NumberFormatException e) {
                        System.out.print("Please enter a valid number: ");
                    }
                }
            }

            if (!gotB) {
                System.out.print("Enter second number: ");
                while (true) {
                    String line = scanner.nextLine();
                    try {
                        b = Double.parseDouble(line.trim());
                        break;
                    } catch (NumberFormatException e) {
                        System.out.print("Please enter a valid number: ");
                    }
                }
            }
        } finally {
            // Close scanner only if we're not in an environment where closing System.in would be problematic
            // We won't close it here to avoid closing System.in unexpectedly.
        }

        double sum = a + b;

        // If the sum is actually an integer, print without decimal
        if (sum == (long) sum) {
            System.out.println("Sum: " + (long) sum);
        } else {
            System.out.println("Sum: " + sum);
        }
    }
}
