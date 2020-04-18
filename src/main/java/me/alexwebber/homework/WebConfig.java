package me.alexwebber.homework;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@SuppressWarnings("deprecation")
@Configuration
@ComponentScan("me.alexwebber.homework")
public class WebConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/").setCachePeriod(31555926);
    }
    
	/*
	 * @Override public void addResourceHandlers(final ResourceHandlerRegistry
	 * registry) {
	 * registry.addResourceHandler("/*.js/**").addResourceLocations("/ui/static/");
	 * registry.addResourceHandler("/*.css/**").addResourceLocations("/ui/static/");
	 * }
	 */

}
