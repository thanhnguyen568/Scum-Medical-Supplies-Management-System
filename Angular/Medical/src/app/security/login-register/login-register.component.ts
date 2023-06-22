import {Component, OnInit} from '@angular/core';
import {animate, state, style, transition, trigger} from '@angular/animations';
import {FormBuilder, FormGroup} from '@angular/forms';

@Component({
  selector: 'app-login-register',
  templateUrl: './login-register.component.html',
  styleUrls: ['./login-register.component.css'],
  animations: [
    trigger('formAnimations', [
      state('login', style({
        transform: 'translateX(0)'
      })),
      state('register', style({
        transform: 'translateX(-100%)'
      })),
      transition('login <=> register', [
        animate('300ms ease-in-out')
      ])
    ])
  ]
})

export class LoginRegisterComponent implements OnInit {
  isLoginForm = true;
  formLogin: FormGroup;
  formRegister: FormGroup;
  username: string;
  roles: string;
  errorMessage = '';

  toggleForm() {
    this.isLoginForm = !this.isLoginForm;
  }

  constructor(private formBuild: FormBuilder) {
  }

  ngOnInit(): void {
    this.formLogin = this.formBuild.group({
        username: [''],
        password: [''],
        remember_me: ['']
      }
    );
    this.formRegister = this.formBuild.group({
        username: [''],
        password: [''],
        remember_me: ['']
      }
    );
  }

  onSubmit() {

  }
}
