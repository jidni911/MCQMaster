// package com.jidnivai.MCQMaster.config;

// import org.springframework.context.annotation.Bean;
// import org.springframework.context.annotation.Configuration;
// import org.springframework.security.config.annotation.web.builders.HttpSecurity;
// import org.springframework.security.core.userdetails.User;
// import org.springframework.security.core.userdetails.UserDetails;
// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
// import org.springframework.security.crypto.password.PasswordEncoder;
// import org.springframework.security.provisioning.InMemoryUserDetailsManager;
// import org.springframework.security.web.SecurityFilterChain;

// @Configuration
// public class SecurityConfig {

//     @Bean
//     public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//         http
//             .authorizeHttpRequests(auth -> auth
//                 .requestMatchers("/login", "/public/**").permitAll() // Public access
//                 .requestMatchers("/admin/**").hasRole("ADMIN")      // Admin access
//                 .requestMatchers("/manager/**").hasRole("MANAGER")  // Manager access
//                 .requestMatchers("/user/**").hasAnyRole("USER", "ADMIN", "MANAGER") // User access
//                 .anyRequest().authenticated()                      // All other requests authenticated
//             )
//             .formLogin(form -> form
//                 .loginPage("/login")                               // Custom login page
//                 .defaultSuccessUrl("/home", true)                  // Default landing page post-login
//                 .permitAll()
//             )
//             .logout(logout -> logout
//                 .logoutUrl("/logout")
//                 .logoutSuccessUrl("/login?logout")
//                 .permitAll()
//             );

//         return http.build();
//     }

//     @Bean
//     public InMemoryUserDetailsManager userDetailsManager(PasswordEncoder passwordEncoder) {
//         // Define in-memory users with roles
//         UserDetails admin = User.builder()
//                 .username("admin")
//                 .password(passwordEncoder.encode("admin123"))
//                 .roles("ADMIN")
//                 .build();

//         UserDetails manager = User.builder()
//                 .username("manager")
//                 .password(passwordEncoder.encode("manager123"))
//                 .roles("MANAGER")
//                 .build();

//         UserDetails user = User.builder()
//                 .username("user")
//                 .password(passwordEncoder.encode("user123"))
//                 .roles("USER")
//                 .build();

//         return new InMemoryUserDetailsManager(admin, manager, user);
//     }

//     @Bean
//     public PasswordEncoder passwordEncoder() {
//         return new BCryptPasswordEncoder();
//     }
// }
