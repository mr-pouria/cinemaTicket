package com.example.cinema.role.data;


import com.example.cinema.BaseEntity;
import com.example.cinema.user.data.UserTO;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "roles")
@SequenceGenerator(name = "seq_roles" , sequenceName = "seq_roles")
public class RoleTO extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "seq_roles")
    @Column(name = "role_id")
    private Long roleId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Role role;


    @OneToMany(mappedBy = "role" , fetch = FetchType.LAZY)
    private List<UserTO> users = new ArrayList<>();


    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public List<UserTO> getUsers() {
        return users;
    }

    public void setUsers(List<UserTO> users) {
        this.users = users;
    }




}
