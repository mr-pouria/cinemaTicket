package com.example.cinema.permission.data;


import com.example.cinema.BaseEntity;
import com.example.cinema.user.data.UserTO;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "permissions")
@SequenceGenerator(name = "seq_permission" , sequenceName = "seq_permission")
public class PermissionTO extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "seq_permission")
    @Column(name = "permission_id")
    private Long permissionId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Permission permission;


    @OneToMany(mappedBy = "permission" , fetch = FetchType.LAZY)
    private List<UserTO> users = new ArrayList<>();

    public Long getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Long permissionId) {
        this.permissionId = permissionId;
    }

    public Permission getPermission() {
        return permission;
    }

    public void setPermission(Permission permission) {
        this.permission = permission;
    }

    public List<UserTO> getUsers() {
        return users;
    }

    public void setUsers(List<UserTO> users) {
        this.users = users;
    }


}
