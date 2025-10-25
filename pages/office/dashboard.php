<?php
require_once __DIR__ . '/../../includes/auth_admin.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" type="image/x-icon" href="/assets/img/favicon.ico">
  <script src="https://cdn.tailwindcss.com"></script>
  <title>Office Dashboard</title>
</head>

<body class="bg-gray-100">
  <div class="flex h-screen">

    <div class="w-64 bg-white shadow-md flex flex-col justify-between">
      <div>
        <div class="text-center py-5 border-b">
          <h2 class="text-lg font-bold">
            <?php echo htmlspecialchars($logged_in_admin); ?>
          </h2>
        </div>

        <nav class="p-4 space-y-2">
          <a href="dashboard.php"
            class="block px-4 py-2 bg-gray-200 rounded-lg font-medium hover:bg-gray-300">Dashboard</a>
          <a href="duty_approval.php" class="block px-4 py-2 rounded-lg hover:bg-gray-200">Duty Approval</a>
          <a href="duty_history.php" class="block px-4 py-2 rounded-lg hover:bg-gray-200">History</a>
          <a href="student_list.php" class="block px-4 py-2 rounded-lg hover:bg-gray-200">Student List</a>
          <a href="admin_management.php" class="block px-4 py-2 rounded-lg hover:bg-gray-200">Admin Management</a>
        </nav>
      </div>
      <form action="/pages/auth/logout.php" method="POST" class="p-4">
        <button type="submit" class="w-full bg-red-600 hover:bg-red-700 text-white py-2 rounded-lg">Log Out</button>
      </form>
    </div>

    <div class="flex-1 p-8 overflow-y-auto">
      <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-10">
        <div class="bg-white p-6 rounded-xl shadow-sm border-l-4 border-purple-500">
          <h3 class="text-gray-500 text-sm font-semibold">Total Student Count</h3>
          <p class="text-3xl font-bold mt-2 text-purple-600">Placeholder</p>
        </div>

        <div class="bg-white p-6 rounded-xl shadow-sm border-l-4 border-red-500">
          <h3 class="text-gray-500 text-sm font-semibold">Rejected Duty Logs</h3>
          <p class="text-3xl font-bold mt-2 text-red-600">Placeholder</p>
        </div>

        <div class="bg-white p-6 rounded-xl shadow-sm border-l-4 border-yellow-500">
          <h3 class="text-gray-500 text-sm font-semibold">Pending Duty Logs</h3>
          <p class="text-3xl font-bold mt-2 text-yellow-600">Placeholder</p>
        </div>

        <div class="bg-white p-6 rounded-xl shadow-sm border-l-4 border-green-500">
          <h3 class="text-gray-500 text-sm font-semibold">Completed Duty Logs</h3>
          <p class="text-3xl font-bold mt-2 text-green-600">Placeholder</p>
        </div>
      </div>
    </div>
</body>

</html>