#include "something.h"
#include <stdio.h>

#define PI 3.14f

class SuperObject
{
public:
	virtual constexpr SuperObject() = default
	explicit constexpr SuperObject(int a) = delete
    [[nodiscard]] bool OtherMethod() noexcept { return false; }

	extern int counte = 5;
	const float counte = PI;
	const char* stringe = "";
	auto raw_str = R"String"
}

namespace Vulkan
{
	namespace Implementation
	{
		int a = 2;
	}
}

int b = Vulkan::Implementation::a;

using Impl = Vulkan::Implementation;

template <typename T>
T superTempl(int* A)
{
    if (std::is_constant_evaluated())
        for(int i = 0; i < 100; i++)
		    i = i + 7;
    static_cast<int>(jjj);
	sizeof(SuperObject);
    typeid(SuperObject).name();
	std::cout << "PROVA!" << std::endl;
	switch ()
	{
    case default:
			return G;
	}

	throw();

	delete A;
	return new T();
}

#define PRETTIFY __LINE__ __FILE__

