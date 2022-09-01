package it.dping.cloudvendingmachines.model;

public class User {
    private Long id_user;
    private Double credit;
    private String username;
    private String password; //user.setPassword(encoder.encode(signUpRequest.getPassword())); /PasswordEncoder encoder;
    private String email;
    private String name;
    private String mobile;
    private Long active;
    private Role role;

    public User() {
    }

    public User(Long id_user, Double credit, String username, String password, String email, String name, String mobile, Long active, Role role) {
        this.id_user = id_user;
        this.credit = credit;
        this.username = username;
        this.password = password;
        this.email = email;
        this.name = name;
        this.mobile = mobile;
        this.active = active;
        this.role = role;
    }

    public Long getId_user() {
        return id_user;
    }

    public void setId_user(Long id_user) {
        this.id_user = id_user;
    }

    public Double getCredit() {
        return credit;
    }

    public void setCredit(Double credit) {
        this.credit = credit;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Long getActive() {
        return active;
    }

    public void setActive(Long active) {
        this.active = active;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" +
                "id_user=" + id_user +
                ", credit=" + credit +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", mobile='" + mobile + '\'' +
                ", active=" + active +
                ", role=" + role +
                '}';
    }
}
