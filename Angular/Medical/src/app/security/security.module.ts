import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {LoginComponent} from './login/login.component';
import {LoginRegisterComponent} from './login-register/login-register.component';
import {ReactiveFormsModule} from '@angular/forms';


@NgModule({
  declarations: [LoginComponent, LoginRegisterComponent],
  exports: [
    LoginComponent,
    LoginRegisterComponent
  ],
  imports: [
    CommonModule,
    ReactiveFormsModule,
  ]
})
export class SecurityModule {
}
