package com.noida.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;
	/*@Autowired
	UserDetailsService userDetailsService;
*/	
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
	  auth.jdbcAuthentication().dataSource(dataSource)
		.usersByUsernameQuery("select username,password, enabled from users where username=?")
		.authoritiesByUsernameQuery("select username, role from user_roles where username=?")
		.passwordEncoder(new BCryptPasswordEncoder());
	}	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {

	  http.authorizeRequests()
	  	.antMatchers("/", "/home").hasAnyRole("ADMIN","APPROVER","ISSUER","USER")
        .antMatchers("/admin/**").hasRole("ADMIN")
        .antMatchers("/approver/**").hasAnyRole("ADMIN","APPROVER")
        .antMatchers("/issuer/**").hasAnyRole("ADMIN","ISSUER")
        .antMatchers("/user/**").hasAnyRole("ADMIN","APPROVER","ISSUER","USER")
        .antMatchers("/login*").permitAll()
		.and()
		  .formLogin().loginPage("/login")
		  .usernameParameter("username").passwordParameter("password")
		.and()
		  .logout().logoutSuccessUrl("/login?logout")
		 .and()
		 .exceptionHandling().accessDeniedPage("/403")
		.and()
		  .csrf();
	}
	
	/*public static void main(String args[]) throws Exception {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("admin: "+encoder.encode("admin"));
		System.out.println("user: "+encoder.encode("user"));
		System.out.println("issuer: "+encoder.encode("issuer"));
		System.out.println("approver: "+encoder.encode("approver"));
	}*/
}
