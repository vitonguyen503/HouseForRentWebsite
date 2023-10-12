<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Form Reverse</title>
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body{
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
    </style>
</head>
<body>
<form style="background-color: rgb(243, 239, 248); padding:20px; height:107vh; width:40%;">
    <div class="space-y-12">
        <div class="border-b border-gray-900/10 pb-12">
            <h2 class="text-base font-semibold leading-7 text-gray-900">Notion</h2>
            <p class="mt-1 text-sm leading-6 text-gray-600">This information will be sended to the poster.</p>

            <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                <div class="sm:col-span-4">
                    <label for="roomid" class="block text-sm font-medium leading-6 text-gray-900">RoomID</label>
                    <div class="mt-2">
                        <div  class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                            <input style="height: 30px;" type="text" name="roomid" id="roomid" autocomplete="roomid" class="block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 focus:ring-0 sm:text-sm sm:leading-6">
                        </div>
                    </div>
                </div>

                <div class="sm:col-span-4">
                    <label for="sendername" class="block text-sm font-medium leading-6 text-gray-900">Sender Name</label>
                    <div class="mt-2">
                        <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                            <input style="height: 30px;" type="text" name="sendername" id="sendername" autocomplete="sendername" class="block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 focus:ring-0 sm:text-sm sm:leading-6">
                        </div>
                    </div>
                </div>

                <div class="sm:col-span-4">
                    <label for="sendernumber" class="block text-sm font-medium leading-6 text-gray-900">Sender Number</label>
                    <div class="mt-2">
                        <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                            <input style="height: 30px;" type="number" name="sendernumber" id="sendernumber" autocomplete="sendernumber" class="block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 focus:ring-0 sm:text-sm sm:leading-6">
                        </div>
                    </div>
                </div>

                <div class="col-span-full">
                    <label for="sendernote" class="block text-sm font-medium leading-6 text-gray-900">Sender Note</label>
                    <div class="mt-2">
                        <textarea id="sendernote" name="sendernote" rows="3" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"></textarea>
                    </div>
                    <p class="mt-3 text-sm leading-6 text-gray-600">Write a few sentences for the poster.</p>
                </div>
            </div>
            <button onclick="redirectinforHome()" style="margin-top: 20px; margin-left:75%" type="button" class="btn btn-secondary">Send</button>
        </div>

    </div>
</form>
<script>
    function redirectinforHome() {
        window.location.href = "inforHome.jsp";
    }
</script>
</body>
</html>
