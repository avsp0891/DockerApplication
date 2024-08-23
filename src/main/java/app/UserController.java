package app;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class UserController {

    private final UserRepository repository;


    @GetMapping("/users")
    public List<User> users() {
        return repository.findAll();
    }

    @PostMapping("/users")
    public User users(@RequestBody User user) {
        return repository.save(user);
    }
}
