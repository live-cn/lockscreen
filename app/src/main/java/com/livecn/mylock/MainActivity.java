package com.livecn.mylock;

import android.app.Activity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends Activity {
    private EditText pinField;
    private final String correctPin = "757060";  // You should store and handle this securely

    @Override
    protected to onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        pinField = findViewById(R.id.pinField);
        pinField.setOnKeyListener((v, keyCode, event) -> {
            if ((event.getAction() == KeyEvent.ACTION_DOWN) && (keyCode == KeyEvent.KEYCODE_ENTER)) {
                // Check if the entered PIN is correct
                if (pinField.getText().toString().equals(correctPin)) {
                    Toast.makeText(MainActivity.this, "Unlocked!", Toast.LENGTH_SHORT).show
