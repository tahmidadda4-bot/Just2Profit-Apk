package com.just2profit.app

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent { Just2ProfitApp() }
    }
}

@Composable
fun Just2ProfitApp() {
    var tab by remember { mutableStateOf(0) }
    val tabs = listOf("Home", "Tasks", "Wallet", "Referral")

    MaterialTheme {
        Scaffold(
            topBar = {
                TopAppBar(title = { Text("Just2Profit") })
            },
            bottomBar = {
                NavigationBar {
                    tabs.forEachIndexed { index, title ->
                        NavigationBarItem(
                            selected = tab == index,
                            onClick = { tab = index },
                            icon = {},
                            label = { Text(title) }
                        )
                    }
                }
            }
        ) { pad ->
            Column(
                modifier = Modifier
                    .padding(pad)
                    .padding(20.dp)
                    .fillMaxSize()
            ) {
                when (tab) {
                    0 -> {
                        Text("Welcome to Just2Profit", style = MaterialTheme.typography.headlineSmall)
                        Spacer(Modifier.height(16.dp))
                        Text("Balance: ৳0.00")
                        Spacer(Modifier.height(8.dp))
                        Text("Complete eligible tasks to earn rewards.")
                    }
                    1 -> {
                        Text("Daily Tasks", style = MaterialTheme.typography.headlineSmall)
                        Spacer(Modifier.height(16.dp))
                        Text("No tasks available yet.")
                    }
                    2 -> {
                        Text("Wallet", style = MaterialTheme.typography.headlineSmall)
                        Spacer(Modifier.height(16.dp))
                        Text("Available balance: ৳0.00")
                        Spacer(Modifier.height(12.dp))
                        Button(onClick = {}) { Text("Request Withdrawal") }
                    }
                    3 -> {
                        Text("Referral", style = MaterialTheme.typography.headlineSmall)
                        Spacer(Modifier.height(16.dp))
                        Text("Your referral code will appear here.")
                    }
                }
            }
        }
    }
}
