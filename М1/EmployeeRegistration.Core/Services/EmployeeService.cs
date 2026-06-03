using EmployeeRegistration.Core.Models;
using System.Text.RegularExpressions;

namespace EmployeeRegistration.Core.Services
{
    public class EmployeeService
    {
        public bool Register(Employee employee)
        {
            if (employee == null)
                return false;

            if (string.IsNullOrWhiteSpace(employee.FullName))
                return false;

            if (employee.FullName.Length > 50)
                return false;

            if (!Regex.IsMatch(employee.FullName, @"^[А-Яа-яЁё\s]+$"))
                return false;

            if (string.IsNullOrWhiteSpace(employee.Snils))
                return false;

            if (!Regex.IsMatch(employee.Snils, @"^\d{11}$"))
                return false;

            if (string.IsNullOrWhiteSpace(employee.Email))
                return false;

            if (!Regex.IsMatch(employee.Email,
                @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
                return false;

            if (employee.Email.Length > 64)
                return false;

            if (employee.HireDate < new DateTime(2010, 1, 1))
                return false;

            if (string.IsNullOrWhiteSpace(employee.Position))
                return false;

            return true;
        }
    }
}