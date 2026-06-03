using EmployeeRegistration.Core.Models;
using EmployeeRegistration.Core.Services;

namespace EmployeeRegistration.Tests.Services
{
    [TestClass]
    public class EmployeeServiceTests
    {
        [TestMethod]
        public void Register_ValidEmployee_ReturnsTrue()
        {
            var service = new EmployeeService();

            var employee = new Employee
            {
                FullName = "Иванов Иван Иванович",
                Snils = "11223344595",
                Email = "ivan@test.ru",
                HireDate = new DateTime(2020, 1, 1),
                Position = "Менеджер"
            };

            bool result = service.Register(employee);

            Assert.IsTrue(result);
        }
        [TestMethod]
        public void Register_EmptyName_ReturnsFalse()
        {
            var service = new EmployeeService();

            var employee = new Employee
            {
                FullName = "",
                Snils = "11223344595",
                Email = "ivan@test.ru",
                HireDate = new DateTime(2020, 1, 1),
                Position = "Менеджер"
            };

            bool result = service.Register(employee);

            Assert.IsFalse(result);
        }
        [TestMethod]
        public void Register_InvalidEmail_ReturnsFalse()
        {
            var service = new EmployeeService();

            var employee = new Employee
            {
                FullName = "Иванов Иван Иванович",
                Snils = "11223344595",
                Email = "ivanmail.ru",
                HireDate = new DateTime(2020, 1, 1),
                Position = "Менеджер"
            };

            bool result = service.Register(employee);

            Assert.IsFalse(result);
        }
        [TestMethod]
        public void Register_DateBefore2010_ReturnsFalse()
        {
            var service = new EmployeeService();

            var employee = new Employee
            {
                FullName = "Иванов Иван Иванович",
                Snils = "11223344595",
                Email = "ivan@test.ru",
                HireDate = new DateTime(2009, 12, 31),
                Position = "Менеджер"
            };

            bool result = service.Register(employee);

            Assert.IsFalse(result);
        }
        [TestMethod]
        public void Register_InvalidSnils_ReturnsFalse()
        {
            var service = new EmployeeService();

            var employee = new Employee
            {
                FullName = "Иванов Иван Иванович",
                Snils = "123",
                Email = "ivan@test.ru",
                HireDate = new DateTime(2020, 1, 1),
                Position = "Менеджер"
            };

            bool result = service.Register(employee);

            Assert.IsFalse(result);
        }
        [TestMethod]
        public void Register_DateEquals2010_ReturnsTrue()
        {
            var service = new EmployeeService();

            var employee = new Employee
            {
                FullName = "Иванов Иван Иванович",
                Snils = "11223344595",
                Email = "ivan@test.ru",
                HireDate = new DateTime(2010, 1, 1),
                Position = "Менеджер"
            };

            bool result = service.Register(employee);

            Assert.IsTrue(result);
        }
    }
}