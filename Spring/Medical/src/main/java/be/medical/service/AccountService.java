package be.medical.service;


import be.medical.entity.Account;

public interface AccountService {
    Account findAccountByUserName(String username);

}
